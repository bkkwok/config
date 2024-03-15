-- :nnoremap <Leader>c :let @+=expand('%:p')<CR>
-- copies path of current file into clipboard
vim.keymap.set("n", "<leader>c", ":let @+=expand('%:p')<CR>")
-- vim.api.nvim_create_user_command('CopyBuffer', 'echo "It works!"', {})

