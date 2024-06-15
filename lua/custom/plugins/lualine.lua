local copilot_status = function()
  return require('copilot_status').status_string()
end

local colors = {
  bg = '#0f0f0f',
  fg = '#6a737d',

  blue = '#79b8ff',
  green = '#85e89d',
  red = '#f85149',
  violet = '#b392f0',
}

local lualine_dngh = {
  normal = {
    a = { fg = colors.violet, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.fg, bg = colors.bg },
  },

  insert = { a = { fg = colors.fg, bg = colors.bg } },
  visual = { a = { fg = colors.fg, bg = colors.bg } },
  replace = { a = { fg = colors.fg, bg = colors.bg } },

  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.fg, bg = colors.bg },
  },
}

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  -- See `:help lualine.txt`
  opts = {
    extensions = { 'nvim-tree', 'trouble', 'toggleterm' },
    options = {
      disabled_filetypes = { 'packer', 'NVimTree', 'NvimTree_1', 'quickfix', 'prompt', 'lazy', 'symbols-outline' },
      icons_enabled = true,
      theme = lualine_dngh,
      component_separators = '',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function()
            -- Define the icons for each mode
            local mode_icons = {
              n = '', -- Normal mode
              i = '', -- Insert mode
              v = '', -- Visual mode
              [''] = '', -- Visual block mode (requires special handling)
              V = '', -- Visual line mode
              c = '', -- Command mode
              R = '', -- Replace mode
              t = '', -- Terminal mode
            }

            -- Get the current mode
            local mode = vim.fn.mode()

            -- Return the corresponding icon
            return mode_icons[mode] or mode:sub(1, 1) -- Fallback to first character of mode if no icon found
          end,
        },
      },
      lualine_b = { 'filename', {
        'branch',
        icon = '',
      } },
      lualine_c = {
        function()
          return require('tinygit.statusline').branchState()
        end,
      },
      lualine_x = {
        copilot_status,
      },
      lualine_y = {
        {
          'filetype',
          colored = false,
          icon_only = true,
          icon = { align = 'left' },
        },
      },
      lualine_z = {
        {
          'diagnostics',

          -- Table of diagnostic sources, available sources are:
          --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
          -- or a function that returns a table as such:
          --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
          sources = { 'nvim_diagnostic', 'coc' },

          -- Displays diagnostics for the defined severity types
          sections = { 'error', 'warn', 'hint' },

          symbols = { error = ' ', warn = ' ', hint = ' ' },
          colored = false, -- Displays diagnostics status in color if set to true.
          update_in_insert = true, -- Update diagnostics in insert mode.
          always_visible = true, -- Show diagnostics even if there are none.
        },
      },
    },
  },
}
