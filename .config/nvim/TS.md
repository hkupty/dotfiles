# Specification: TSF (Tree-Sitter Frontend)

A lightweight Lua-based manager for Neovim that downloads, compiles, and registers Tree-sitter parsers without the overhead of nvim-treesitter.

## 1. Objective

Create a minimal Tree-sitter parser manager that:
- Downloads parser source from GitHub repositories
- Compiles parsers to shared objects using `zig cc`
- Registers parsers for auto-discovery by Neovim (zero runtime cost)
- Manages queries via symlinks to user config
- Pins versions to prevent breaking builds

## 2. Core Requirements

### 2.1 Dependencies
- **Required**: `git`, `zig`, Neovim 0.12+
- **No Lua dependencies** (pure Neovim Lua API)

### 2.2 Behavior
- Manual trigger only (no auto-updates)
- Version pinning for reproducibility
- Cache cloned repositories for incremental rebuilds

### 2.3 Files Created
- **Parsers**: `stdpath("data")/site/parser/{lang}.so` (auto-discovered by Neovim)
- **Queries**: `stdpath("config")/queries/{lang}/` (symlinked, auto-discovered)
- **Cache**: `~/.local/share/tsf/{lang}/` (cloned repository)
- **Versions**: `~/.local/share/tsf/versions.lua` (tracks pinned commits)

## 3. Directory Structure

```
-- Parser output (auto-loaded by Neovim) --
stdpath("data")/site/parser/
├── lua.so
├── python.so
└── ...

-- Queries (auto-discovered via runtimepath) --
stdpath("config")/queries/
├── lua/
│   ├── highlights.scm
│   ├── folds.scm
│   └── indents.scm
├── python/
│   └── ...

-- Cache (persisted for rebuilds) --
~/.local/share/tsf/
├── versions.lua        -- pinned commits: { lang = { url = "...", rev = "..." } }
├── tree-sitter-lua/   -- cloned repository
├── tree-sitter-python/
└── ...
```

## 4. Architecture

### 4.1 Registry

TSF does NOT hardcode parser URLs. Instead, the user provides language names as arguments, and TSF constructs URLs using a predictable pattern:

```
https://github.com/tree-sitter/tree-sitter-{lang}
```

If a parser uses a non-standard repository name, allow override via explicit URL:

```lua
-- Optional: custom registry for non-standard names
local custom_parsers = {
  -- example: javascript has tree-sitter-javascript as the repo name
  javascript = { url = "https://github.com/tree-sitter/tree-sitter-javascript" },
 typescript = { url = "https://github.com/tree-sitter/tree-sitter-typescript" },
}
```

### 4.2 Version Pinning

- On first install: clone at default branch tip, record commit hash in `versions.lua`
- On update: fetch latest, record new commit
- The version file is a Lua module returning a table:

```lua
-- ~/.local/share/tsf/versions.lua
return {
  lua = { url = "https://github.com/tree-sitter/tree-sitter-lua", rev = "abc123" },
  python = { url = "https://github.com/tree-sitter/tree-sitter-python", rev = "def456" },
}
```

### 4.3 Compilation Command

Use `zig cc` with the following flags:

```sh
zig cc -shared -fPIC -target native -O2 -o {lang}.so src/parser.c {scanner_files} -I./src
```

**Scanner detection**:
- Check for `src/scanner.c` → include
- Check for `src/scanner.cc` or `src/scanner.cpp` → include (zig handles C++ automatically)
- Glob pattern: `src/scanner.*`

### 4.4 Query Symlinking

For each `{lang}`, after cloning:
1. Check for `queries/` directory in repo root
2. For each `*.scm` file, create symlink:
   - Source: `~/.local/share/tsf/{lang}/queries/{file}.scm`
   - Target: `stdpath("config")/queries/{lang}/{file}.scm`

If queries directory doesn't exist in the parser repo, skip silently.

## 5. User Interface

### 5.1 Commands

| Command | Description |
|---------|-------------|
| `:TSF install <lang>...` | Install one or more parsers (download + compile + link queries) |
| `:TSF update [<lang>...]` | Update installed parsers to latest; if no lang given, update all |
| `:TSF remove <lang>...` | Uninstall: remove .so, symlinks, and cached repo |
| `:TSF list` | List installed parsers with their pinned versions |
| `:TSF clean` | Remove all cached repos and versions (reinstall from scratch) |

### 5.2 Examples

```vim
:TSF install lua python javascript
:TSF update
:TSF update python
:TSF remove lua
:TSF list
:TSF clean
```

### 5.3 Output

- **Success**: `vim.notify("{lang} installed", vim.log.levels.INFO)`
- **Errors**: `vim.notify("{error}", vim.log.levels.ERROR)`
- **Progress**: May use `vim.defer_fn()` or `vim.notify()` with DEBUG level

## 6. Logical Flow

### 6.1 Install Flow

```
install(langs)
  for each lang in langs
    -> get_url(lang)           -- construct or lookup URL
    -> get_cached_rev(lang)   -- check versions.lua
    -> clone_or_update(url, rev?)  -- clone if not cached
    -> compile(lang)         -- zig cc command
    -> install_parser(so)    -- move to stdpath("data")/site/parser/
    -> link_queries(lang)   -- create symlinks in queries/
    -> pin_version(lang)    -- record in versions.lua
  end
```

**clone_or_update(url, rev)**:
- If cached: cd to cache dir, `git fetch origin`, checkout `rev` or `origin/default`
- If not cached: `git clone --depth 1 {url} {cache_dir}`

**compile(lang)**:
```
cache_dir = ~/.local/share/tsf/{lang}
src_files = glob(cache_dir/src/parser.*)
scanner_files = glob(cache_dir/src/scanner.*)
cmd = "zig cc -shared -fPIC -target native -O2 -o {lang}.so " .. src_files .. " " .. scanner_files .. " -I./src"
execute_async(cmd)
```

**link_queries(lang)**:
```
query_dir = stdpath("config")/queries/{lang}
ensure_dir(query_dir)
for each .scm file in cache_dir/queries/
  -- create relative symlink
  ln -s {cache_dir}/queries/{file}.scm {query_dir}/{file}.scm
end
```

### 6.2 Update Flow

```
update(langs?)
  if langs is empty
    langs = all_installed()
  
  for each lang in langs
    -> get_cached_url(lang)
    -> fetch_and_checkout(cache_dir, "origin/default")
    -> compile(lang)
    -> pin_version(lang)
  end
```

### 6.3 Remove Flow

```
remove(langs)
  for each lang in langs
    -> rm(stdpath("data")/site/parser/{lang}.so)
    -> rm(stdpath("config")/queries/{lang}/)  -- the symlinks
    -> rm_rf(~/.local/share/tsf/{lang})     -- cached repo
    -> remove_from_versions(lang)
  end
```

### 6.4 List Flow

```
list()
  versions = load_versions()
  for lang, info in pairs(versions)
    print("{lang}: {info.rev}")
  end
```

## 7. Edge Cases

### 7.1 Parser Not Found
If `https://github.com/tree-sitter/tree-sitter-{lang}` does not exist:
- Notify error: "Parser '{lang}' not found. Check URL or provide explicit repository."
- Allow custom URL override via registry key

### 7.2 Compilation Failure
- Capture stderr from zig cc
- Notify error with captured output: "Compilation failed:\n{stderr}"

### 7.3 No Queries in Parser Repo
- Silent skip - not all parsers include queries
- Do not create empty query directories

### 7.4 Network Failure
- If clone fails: "Failed to clone {url}: {error}"
- If fetch fails: "Failed to fetch updates: {error}"

### 7.5 Existing Installation
- On install: skip if .so already exists
- Provide force flag: `:TSF! install <lang>` to reinstall

## 8. Implementation Notes

### 8.1 Async Execution
Use `vim.uv` (or `vim.loop` for 0.12 compatibility) to run compilation asynchronously:

```lua
local function exec_async(cmd, on_done, on_error)
  local handle = io.popen(cmd, "r")
  -- or use vim.uv.spawn with stdout callback
end
```

### 8.2 Paths
Define helpers:

```lua
local Paths = {
  parser = function() return stdpath("data") .. "/site/parser" end,
  query = function() return stdpath("config") .. "/queries" end,
  cache = function() return vim.fn.stdpath("data") .. "/../share/tsf" end,
  versions = function() return Paths.cache() .. "/versions.lua" end,
}
```

### 8.3 Vim Functions
Expose commands:

```lua
vim.api.nvim_create_user_command("TSF", function(opts)
  local args = vim.fn.split(opts.args, " ")
  local cmd = args[1]
  local langs = args[2:]
  -- route to appropriate handler
end, { nargs = "+", complete = completion_function })
```

## 9. Acceptance Criteria

1. `:TSF install lua` produces a working parser in `stdpath("data")/site parser/lua.so`
2. Opening a `.lua` file triggers treesitter highlighting automatically (no manual `language.add()`)
3. `:TSF list` shows installed parsers with their pinned commits
4. `:TSF update` bumps pinned versions to latest
5. `:TSF remove` cleanly removes all artifacts
6. No runtime cost: parsers are auto-discovered via directory structure
7. Errors are surfaced via `vim.notify()` with appropriate severity