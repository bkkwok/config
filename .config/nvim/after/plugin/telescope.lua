local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set("n", "<leader>pg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
