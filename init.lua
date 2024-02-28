-- =============================================================================
-- BASIC CONFIGURATIONS
-- =============================================================================

-- Store yanked string to clipboard
vim.opt.clipboard = 'unnamedplus'

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Enter a tab as 2 space characters
vim.opt.tabstop = 2

-- Shift by 2 space characters when indented
vim.opt.shiftwidth = 2

-- Round the indents to multiple of shiftwidth
vim.opt.shiftround = true

-- Show line numbers
vim.opt.number = true

-- Show title
vim.opt.title = true

-- Enable mouse input in all modes
vim.opt.mouse = 'a'

-- Always display status line
vim.opt.laststatus = 2

-- Show invisible characters
vim.opt.list = true

-- Show end-of-line code '$'
vim.opt.listchars = { tab = '>~', eol = '$' }

-- Enable cursor move across lines
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'

-- Set end-of-line code to LF
vim.opt.fileformats = 'unix,dos,mac'

-- Set shell to PowerShell
vim.opt.shell = 'pwsh'

-- Enable true color
vim.opt.termguicolors = true


-- =============================================================================
-- TERMINAL
-- =============================================================================

-- Terminal (Command): Open a terminal in the bottom part of the screen
vim.api.nvim_create_user_command('Terminal',
  function()
    vim.cmd('split | wincmd j | resize 20 | terminal')
  end,
  { desc = 'Open a terminal in the bottom part of the screen' }
)

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = { '*' },
  callback = function()
    -- Not display line numbers in terminal
    vim.opt_local.number = false

    -- Automatic shift to insert mode at terminal startup
    vim.cmd('startinsert')
  end
})

-- Exit terminal mode
vim.keymap.set(
  't', '<Esc><Esc>', '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)


-- =============================================================================
-- PLUGIN
-- =============================================================================

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
