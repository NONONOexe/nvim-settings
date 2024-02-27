return {
  'ellisonleao/gruvbox.nvim',
  priority = 10000,
  lazy = false,
  config = function()
    require('gruvbox').setup({
      italic = {
        strings = false,
        comments = false,
      },
    })
    vim.cmd.colorscheme('gruvbox')
  end,
}
