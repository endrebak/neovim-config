
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fc', ":lua require('telescope.builtin').find_files({cwd = vim.fn.expand('%:p:h')})<CR>", {noremap = true})


