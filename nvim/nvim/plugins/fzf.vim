let s:project_dir = '/opt/code/'
let s:project_cmd = "find ".s:project_dir." -maxdepth 3 -name '.git' -printf '%h\n'"
let s:TYPE = {'dict': type({}), 'funcref': type(function('call')), 'string': type('')}
let s:edited_cmd = "git status --porcelain"
let s:diff_master_cmd = "git diff master..HEAD --name-only"


function! s:grep_files(arg, path, bang)
  call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" ' . shellescape(a:arg) . ' ' . shellescape(a:path)  , 1, a:bang)
endfunction

function! s:pre_grep(tests, bang)
  call inputsave()
  let query = input("search " . (a:tests ? "all" : "code") . " → ")
  call inputrestore()
  call s:grep_files(query, a:tests ? "." : "src/", a:bang)
endfunction

function! s:open(args)
  let [_, fname] = a:args
  if fname =~ " "
    let [_, fname] = split(fname, ' ')
  endif
  exec "silent edit" fname
endfunction

function! s:go_to(args)
  let [data, fname] = a:args
  exec "tcd" fname
  exec "silent edit" fname
endfunction

function! s:select_projects(bang)
  return fzf#run(fzf#wrap('projects',{
   \ 'source':  s:project_cmd,
   \ 'dir':     s:project_dir,
   \ 'sink*':   function('s:go_to'),
   \ 'options': '+m --prompt="Projects → " --header-lines=0 --expect=ctrl-e --tiebreak=index'}, a:bang))
endfunction

function! s:git_files(cmd, bang)
  return fzf#run(fzf#wrap('edited',{
   \ 'source':  a:cmd,
   \ 'dir':     getcwd(-1, 0),
   \ 'sink*':   function('s:open'),
   \ 'options': '+m --prompt="Files → " --header-lines=0 --expect=ctrl-e --tiebreak=index'}, a:bang))
endfunction

command! -bar -bang Grep      call s:pre_grep(0, <bang>0)
command! -bar -bang GrepAll   call s:pre_grep(1, <bang>0)
command! -bar -bang Projects  call s:select_projects(<bang>0)
command! -bar -bang Gstatus   call s:git_files(s:edited_cmd, <bang>0)
command! -bar -bang Gdiff     call s:git_files(s:diff_master_cmd, <bang>0)
