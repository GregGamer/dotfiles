local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<leader>F', builtin.find_files, {})
