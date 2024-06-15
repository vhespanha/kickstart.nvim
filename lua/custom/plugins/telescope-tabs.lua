return {
    'LukasPietzschmann/telescope-tabs',
    config = function()
        require('telescope').load_extension 'telescope-tabs'
        require('telescope-tabs').setup {
            vim.keymap.set('n', '<leader>st', require('telescope-tabs').list_tabs, { desc = '[S]how current [T]abs' })
        }
    end,
    dependencies = { 'nvim-telescope/telescope.nvim' },
}
