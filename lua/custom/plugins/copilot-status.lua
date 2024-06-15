return {
  'jonahgoldwastaken/copilot-status.nvim',
  dependencies = { 'zbirenbaum/copilot.lua' },
  lazy = true,
  event = 'BufReadPost',
  config = function()
    require('copilot_status').setup {
      icons = {
        idle = '',
        error = '',
        offline = '',
        warning = '',
        loading = '',
      },
      debug = false,
    }
  end,
}
