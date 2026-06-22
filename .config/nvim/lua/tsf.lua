local TSF = {}

TSF.custom_parsers = {
  authzed = { url = "https://github.com/mleonidas/tree-sitter-authzed"},
  bash = { url = "https://github.com/tree-sitter/tree-sitter-bash" },
  dockerfile = { url = "https://github.com/camdencheek/tree-sitter-dockerfile" },
  git_config = { url = "https://github.com/the-mikedavis/tree-sitter-git-config" },
  git_rebase = { url = "https://github.com/the-mikedavis/tree-sitter-git-rebase" },
  gitcommit = { url = "https://github.com/gbprod/tree-sitter-gitcommit" },
  gitignore = { url = "https://github.com/shunsambongi/tree-sitter-gitignore" },
  go = { url = "https://github.com/tree-sitter/tree-sitter-go" },
  gowork = { url = "https://github.com/omertuc/tree-sitter-go-work" },
  gomod = { url = "https://github.com/camdencheek/tree-sitter-go-mod" },
  gosum = { url = "https://github.com/tree-sitter-grammars/tree-sitter-go-sum" },
  java = { url = "https://github.com/tree-sitter/tree-sitter-java" },
  jq = { url = "https://github.com/flurie/tree-sitter-jq" },
  json = { url = "https://github.com/tree-sitter/tree-sitter-json" },
  lua = { url = "https://github.com/tree-sitter-grammars/tree-sitter-lua" },
  markdown = { url = "https://github.com/tree-sitter-grammars/tree-sitter-markdown" },
  markdown_inline = { url = "https://github.com/tree-sitter-grammars/tree-sitter-markdown" },
  python = { url = "https://github.com/tree-sitter/tree-sitter-python" },
  proto = { url = "https://github.com/coder3101/tree-sitter-proto" },
  regex = { url = "https://github.com/tree-sitter/tree-sitter-regex" },
  toml = { url = "https://github.com/tree-sitter-grammars/tree-sitter-toml" },
  yaml = { url = "https://github.com/tree-sitter-grammars/tree-sitter-yaml" },
  vim = { url = "https://github.com/tree-sitter-grammars/tree-sitter-vim" },
  vimdoc = { url = "https://github.com/neovim/tree-sitter-vimdoc" },
  zig = { url = "https://github.com/tree-sitter-grammars/tree-sitter-zig" },
}

TSF.paths = {
  parser = function()
    return vim.fn.stdpath("data") .. "/site/parser"
  end,
  query = function()
    return vim.fn.stdpath("config") .. "/queries"
  end,
  cache = function()
    return vim.fn.stdpath("cache") .. "/tsf"
  end,
  queries_cache = function()
    return vim.fn.stdpath("cache") .. "/tsf/queries"
  end,
  versions = function()
    return TSF.paths.cache() .. "/versions.lua"
  end,
}

local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "TSF" })
end

local function err(msg)
  notify(msg, vim.log.levels.ERROR)
end

local function ensure_dir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

local function exec(cmd)
  local handle = io.popen(cmd)
  local output = handle:read("*a")
  handle:close()
  return output
end

local function exec_async(cmd, on_done, on_error)
  local handle = io.popen(cmd .. " 2>&1")
  handle:close()
  if on_done then
    vim.defer_fn(on_done, 10)
  end
end

local function glob(pattern)
  local cmd = string.format("ls -1 %s 2>/dev/null", pattern)
  local output = exec(cmd)
  if output == "" then
    return {}
  end
  local files = {}
  for line in output:gmatch("[^\r\n]+") do
    table.insert(files, line)
  end
  return files
end


local function get_url(lang)
  if TSF.custom_parsers[lang] then
    return TSF.custom_parsers[lang].url
  end
  local url1 = string.format("https://github.com/tree-sitter/tree-sitter-%s", lang)
  local url2 = string.format("https://github.com/tree-sitter-grammars/tree-sitter-%s", lang)
  local check1 = string.format("git ls-remote --exit-code '%s' 2>/dev/null", url1)
  local out1 = exec(check1)
  if out1 and not out1:match("fatal") and out1 ~= "" then
    return url1
  end
  return url2
end

local function load_versions()
  local ver_file = TSF.paths.versions()
  if vim.fn.filereadable(ver_file) == 1 then
    local ok, result = pcall(dofile, ver_file)
    if ok then
      return result
    end
  end
  return {}
end

local function save_versions(versions)
  local ver_file = TSF.paths.versions()
  local cache_dir = TSF.paths.cache()
  ensure_dir(cache_dir)

  local lines = { "return {" }
  for lang, info in pairs(versions) do
    local custom_queries_val = info.custom_queries and "true" or "false"
    table.insert(lines, string.format('  %s = { url = "%s", rev = "%s", custom_queries = %s },', lang, info.url, info.rev, custom_queries_val))
  end
  table.insert(lines, "}")
  vim.fn.writefile(lines, ver_file)
end

local function get_cached_rev(lang)
  local versions = load_versions()
  return versions[lang] and versions[lang].rev or nil
end

local function get_cached_url(lang)
  local versions = load_versions()
  return versions[lang] and versions[lang].url or nil
end

local function pin_version(lang, url, rev, use_custom)
  local versions = load_versions()
  versions[lang] = { url = url, rev = rev, custom_queries = use_custom or false }
  save_versions(versions)
end

local function remove_from_versions(lang)
  local versions = load_versions()
  versions[lang] = nil
  save_versions(versions)
end

local function get_custom_queries_url(lang)
  return string.format("https://github.com/neovim-treesitter/nvim-treesitter-queries-%s", lang)
end

local function check_custom_queries_exists(lang)
  local url = get_custom_queries_url(lang)
  local cmd = string.format("git ls-remote --exit-code '%s' 2>/dev/null", url)
  local out = exec(cmd)
  return out and not out:match("fatal") and out ~= ""
end

local function get_custom_queries_cache_dir(lang)
  return TSF.paths.queries_cache() .. "/" .. lang
end

local function clone_or_fetch_custom_queries(lang)
  local url = get_custom_queries_url(lang)
  local cache_dir = get_custom_queries_cache_dir(lang)

  if vim.fn.isdirectory(cache_dir) == 1 then
    local fetch_cmd = string.format("cd '%s' && git fetch origin 2>&1", cache_dir)
    local fetch_out = exec(fetch_cmd)
    if fetch_out:match("fatal") then
      return nil, "Failed to fetch custom queries: " .. fetch_out
    end

    local checkout_cmd = string.format("cd '%s' && git checkout origin/default 2>&1", cache_dir)
    exec(checkout_cmd)

    local rev_cmd = string.format("cd '%s' && git rev-parse HEAD", cache_dir)
    local new_rev = exec(rev_cmd):gsub("%s+", "")
    return new_rev
  else
    ensure_dir(TSF.paths.queries_cache())
    local clone_cmd = string.format("git clone --depth 1 '%s' '%s' 2>&1", url, cache_dir)
    local clone_out = exec(clone_cmd)
    if clone_out:match("fatal") then
      return nil, "Failed to clone custom queries: " .. clone_out
    end

    local rev_cmd = string.format("cd '%s' && git rev-parse HEAD", cache_dir)
    local new_rev = exec(rev_cmd):gsub("%s+", "")
    return new_rev
  end
end

local function clone_or_update(url, cache_dir, rev)
  if vim.fn.isdirectory(cache_dir) == 1 then
    local fetch_cmd = string.format("cd '%s' && git fetch origin 2>&1", cache_dir)
    local fetch_out = exec(fetch_cmd)
    if fetch_out:match("fatal") then
      return nil, "Failed to fetch updates: " .. fetch_out
    end

    local checkout_target = rev or "origin/default"
    local checkout_cmd = string.format("cd '%s' && git checkout %s 2>&1", cache_dir, checkout_target)
    local checkout_out = exec(checkout_cmd)
    if checkout_out:match("fatal") then
      return nil, "Failed to checkout: " .. checkout_out
    end

    local rev_parse_cmd = string.format("cd '%s' && git rev-parse HEAD", cache_dir)
    local new_rev = exec(rev_parse_cmd):gsub("%s+", "")
    return new_rev
  else
    ensure_dir(TSF.paths.cache())
    local clone_cmd
    if rev then
      clone_cmd = string.format("git clone --depth 1 '%s' '%s' 2>&1", url, cache_dir)
    else
      clone_cmd = string.format("git clone --depth 1 '%s' '%s' 2>&1", url, cache_dir)
    end
    local clone_out = exec(clone_cmd)
    if clone_out:match("fatal") then
      return nil, "Failed to clone " .. url .. ": " .. clone_out
    end

    local rev_parse_cmd = string.format("cd '%s' && git rev-parse HEAD", cache_dir)
    local new_rev = exec(rev_parse_cmd):gsub("%s+", "")
    return new_rev
  end
end

local function compile_parser(cache_dir, lang)
  if lang == "markdown" then
    cache_dir = cache_dir .. "/tree-sitter-markdown"
  elseif lang == "markdown_inline" then
    cache_dir = cache_dir .. "/tree-sitter-markdown-inline"
  end

  local src_files = glob(cache_dir .. "/src/parser.c")
  local scanner_files = glob(cache_dir .. "/src/scanner.*")

  local all_files = vim.list_extend(src_files, scanner_files)
  local files_str = table.concat(all_files, " ")

  local output = TSF.paths.parser() .. "/" .. lang .. ".so"
  local cmd = string.format(
    "cd '%s' && zig cc -shared -fPIC -target native -O2 -o '%s' %s -I./src 2>&1",
    cache_dir, output, files_str
  )

  local compile_out = exec(cmd)
  if compile_out ~= "" and not compile_out:match("warning") then
    return nil, "Compilation failed:\n" .. compile_out
  end

  return output
end

local function link_queries(cache_dir, lang, use_custom)
  local query_src
  local use_custom_queries = use_custom

  if use_custom then
    local custom_cache_dir = get_custom_queries_cache_dir(lang)
    if vim.fn.isdirectory(custom_cache_dir) == 1 then
      query_src = custom_cache_dir .. "/queries"
    else
      use_custom_queries = false
    end
  end

  if not use_custom_queries then
    query_src = cache_dir .. "/queries"
    if lang == "markdown" then
      query_src = cache_dir .. "/tree-sitter-markdown/queries"
    elseif lang == "markdown_inline" then
      query_src = cache_dir .. "/tree-sitter-markdown-inline/queries"
    end
  end

  if vim.fn.isdirectory(query_src) == 0 then
    return
  end

  local query_dest = TSF.paths.query() .. "/" .. lang
  ensure_dir(query_dest)

  local files = glob(query_src .. "/*.scm")
  for _, file in ipairs(files) do
    local filename = vim.fn.fnamemodify(file, ":t")
    local link_target = query_dest .. "/" .. filename
    if vim.fn.filereadable(link_target) == 1 then
      vim.fn.delete(link_target)
    end
    vim.fn.system(string.format("ln -s '%s' '%s'", file, link_target))
  end
end

local function install_parser(lang, force)
  local parser_file = TSF.paths.parser() .. "/" .. lang .. ".so"
  if vim.fn.filereadable(parser_file) == 1 and not force then
    notify(string.format("%s already installed", lang))
    return true
  end

  local url = get_url(lang)
  local cache_dir = TSF.paths.cache() .. "/" .. lang

  local rev, clone_err = clone_or_update(url, cache_dir)
  if clone_err then
    err(clone_err)
    return false
  end

  local compiled, compile_err = compile_parser(cache_dir, lang)
  if compile_err then
    err(compile_err)
    return false
  end

  local use_custom = check_custom_queries_exists(lang)
  if use_custom then
    local _, fetch_err = clone_or_fetch_custom_queries(lang)
    if fetch_err then
      notify(string.format("Custom queries unavailable, using defaults: %s", fetch_err), vim.log.levels.WARN)
      use_custom = false
    end
  end

  link_queries(cache_dir, lang, use_custom)
  pin_version(lang, url, rev, use_custom)

  notify(string.format("%s installed", lang))
  return true
end

local function update_parser(lang)
  local cache_dir = TSF.paths.cache() .. "/" .. lang
  if vim.fn.isdirectory(cache_dir) == 0 then
    err(string.format("%s not installed", lang))
    return false
  end

  local url = get_cached_url(lang)
  if not url then
    url = get_url(lang)
  end

  local rev, update_err = clone_or_update(url, cache_dir)
  if update_err then
    err(update_err)
    return false
  end

  local compiled, compile_err = compile_parser(cache_dir, lang)
  if compile_err then
    err(compile_err)
    return false
  end

  local versions = load_versions()
  local had_custom_queries = versions[lang] and versions[lang].custom_queries or false
  local use_custom = check_custom_queries_exists(lang)

  if use_custom then
    local _, fetch_err = clone_or_fetch_custom_queries(lang)
    if fetch_err then
      notify(string.format("Custom queries unavailable, using defaults: %s", fetch_err), vim.log.levels.WARN)
      use_custom = false
    end
  elseif had_custom_queries then
    notify(string.format("Custom queries no longer available, falling back to defaults", lang), vim.log.levels.WARN)
  end

  link_queries(cache_dir, lang, use_custom)
  pin_version(lang, url, rev, use_custom)

  notify(string.format("%s updated", lang))
  return true
end

local function remove_parser(lang)
  local parser_file = TSF.paths.parser() .. "/" .. lang .. ".so"
  if vim.fn.filereadable(parser_file) == 1 then
    vim.fn.delete(parser_file)
  end

  local query_dir = TSF.paths.query() .. "/" .. lang
  if vim.fn.isdirectory(query_dir) == 1 then
    vim.fn.delete(query_dir, "rf")
  end

  local cache_dir = TSF.paths.cache() .. "/" .. lang
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
  end

  local custom_queries_cache = get_custom_queries_cache_dir(lang)
  if vim.fn.isdirectory(custom_queries_cache) == 1 then
    vim.fn.delete(custom_queries_cache, "rf")
  end

  remove_from_versions(lang)

  notify(string.format("%s removed", lang))
end

local function list_parsers()
  local versions = load_versions()
  local found = false
  for lang, info in pairs(versions) do
    local custom_marker = info.custom_queries and " (custom queries)" or ""
    notify(string.format("%s: %s%s", lang, info.rev, custom_marker))
    found = true
  end
  if not found then
    notify("No parsers installed")
  end
end

local function clean_all()
  local cache_dir = TSF.paths.cache()
  if vim.fn.isdirectory(cache_dir) == 1 then
    vim.fn.delete(cache_dir, "rf")
  end

  local query_base = TSF.paths.query()
  local versions = load_versions()
  for lang, _ in pairs(versions) do
    local query_dir = query_base .. "/" .. lang
    if vim.fn.isdirectory(query_dir) == 1 then
      vim.fn.delete(query_dir, "rf")
    end
  end

  notify("Cleaned all cached repos and versions")
end

TSF.commands = {
  install = function(langs, force)
    for _, lang in ipairs(langs) do
      install_parser(lang, force)
    end
  end,
  update = function(langs)
    if #langs == 0 then
      local versions = load_versions()
      for lang, _ in pairs(versions) do
        update_parser(lang)
      end
    else
      for _, lang in ipairs(langs) do
        update_parser(lang)
      end
    end
  end,
  remove = function(langs)
    for _, lang in ipairs(langs) do
      remove_parser(lang)
    end
  end,
  list = function()
    list_parsers()
  end,
  clean = function()
    clean_all()
  end,
}

function TSF.setup(opts)
  if opts and opts.custom_parsers then
    TSF.custom_parsers = opts.custom_parsers
  end
end

function TSF.run(args, force)
  local cmd = args[1]
  local langs = vim.list_slice(args, 2)

  local handler = TSF.commands[cmd]
  if handler then
    if cmd == "install" then
      handler(langs, force)
    else
      handler(langs)
    end
  else
    err(string.format("Unknown command: %s", cmd))
  end
end

vim.api.nvim_create_user_command("TSF", function(opts)
  local args = vim.fn.split(opts.args, " ")
  local force = false

  if args[1] and args[1]:match("^!") then
    force = true
    args[1] = args[1]:sub(2)
  end

  TSF.run(args, force)
end, { nargs = "+" })

return TSF
