-- Enable true colors
vim.opt.termguicolors = true

-- Define custom highlight group with transparency
vim.cmd [[
  highlight MyVirtColumn guifg=#131313 guibg=NONE 
]]

-- Plugin configuration
return {
  'lukas-reineke/virt-column.nvim',
  opts = {
    enable = true,
    char = { '│' },
    virtcolumn = '120',
    highlight = 'MyVirtColumn',
  },
}
