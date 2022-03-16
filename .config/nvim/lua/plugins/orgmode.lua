require('orgmode').setup_ts_grammar()

require('orgmode').setup({
  org_agenda_files = {'/opt/code/notes/org/agenda/'},
  org_default_notes_file = '/opt/code/notes/org/refile.org',
})
