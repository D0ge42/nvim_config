local saga = require("lspsaga")
saga.setup({
  error_sign = '✗',
  warn_sign = '⚠',
  hint_sign = '',
  infor_sign = '',
  border_style = "rounded",  -- Border style for LSP UI
  code_action_icon = '💡',
  lightbulb = {
	  enable = false,
  },
  symbol_in_winbar = {
	  enable = false
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  rename_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  definition_action_keys = {
    edit = '<CR>',
    vsplit = '<C-v>',
    split = '<C-x>',
  },
  rename_prompt_prefix = "Rename: ",
})

