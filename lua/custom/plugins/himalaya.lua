return {
  'https://git.sr.ht/~soywod/himalaya-vim',
  config = function()
    vim.cmd 'syntax on'
    vim.cmd 'filetype plugin on'
    vim.o.hidden = true
    vim.g.himalaya_folder_picker = 'telescope'
    vim.g.himalaya_folder_picker_telescope_preview = 1
  end,
}
