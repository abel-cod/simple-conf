-- ~/.config/nvim/lua/mytheme.lua

-- Define your Kitty theme colors
local colors = {
  bg = '#161616',          -- Background
  fg = '#F1EFF0',          -- Foreground
  cursor = '#AAAAAA',      -- Cursor
  selection_bg = '#292929',-- Selection background
  color0 = '#181818',      -- Black
  color1 = '#D7B650',      -- Yellow (custom)
  color2 = '#496519',      -- Dark green
  color3 = '#BCBF30',      -- Yellow-green
  color4 = '#FFD700',      -- Gold
  color5 = '#348B4A',      -- Green
  color6 = '#678C61',      -- Cyan-green
  color7 = '#6D683C',      -- Olive
  color8 = '#404040',      -- Gray (bright black)
  color9 = '#816C00',      -- Dark yellow (bright)
  color10 = '#305636',     -- Darker green (bright)
  color11 = '#FFD770',     -- Bright yellow
  color12 = '#4692EA',     -- Blue
  color13 = '#644A7F',     -- Purple
  color14 = '#81AD8E',     -- Light cyan
  color15 = '#CEB874'      -- Beige
}

-- Enable true color support
vim.o.termguicolors = true

-- Clear existing highlights
vim.cmd('highlight clear')

-- Set basic UI highlight groups
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.bg, bg = colors.cursor })
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.selection_bg })

-- Set syntax highlight groups (customize as needed)
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.color7 })      -- Olive for comments
vim.api.nvim_set_hl(0, 'String', { fg = colors.color2 })       -- Dark green for strings
vim.api.nvim_set_hl(0, 'Number', { fg = colors.color3 })       -- Yellow-green for numbers
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.color1 })      -- Yellow for keywords
vim.api.nvim_set_hl(0, 'Function', { fg = colors.color4 })     -- Gold for functions
vim.api.nvim_set_hl(0, 'Type', { fg = colors.color5 })         -- Green for types
vim.api.nvim_set_hl(0, 'Special', { fg = colors.color6 })      -- Cyan-green for special characters
vim.api.nvim_set_hl(0, 'Error', { fg = colors.color1, bg = colors.bg }) -- Yellow on bg for errors

-- Optional: Additional UI elements
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = colors.color0 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.color7, bg = colors.color0 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.color8 })
