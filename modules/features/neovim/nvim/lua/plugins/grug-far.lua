return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      transient = true,
      engines = {
        ripgrep = {
          extraArgs = "--hidden "
            .. "--glob !.git/** "
            .. "--glob !node_modules/** "
            .. "--glob !build/** "
            .. "--glob !dist/** "
        }
      },
      keymaps = {
        close = { n = '<Esc>' }
      },
      vim.keymap.set({'n', 'x'}, '<leader>fr', '<cmd>GrugFar<CR>', { desc = "Find and Replace with GrugFar"})
    });
  end
}
