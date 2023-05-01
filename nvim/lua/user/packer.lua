-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        'jessarcher/onedark.nvim',
        config = function()
            vim.cmd('colorscheme onedark')

            -- Hide the characters in FloatBorder
            vim.api.nvim_set_hl(0, 'FloatBorder', {
                fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
                bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
            })

            -- Make the StatusLineNonText background the same as StatusLine
            vim.api.nvim_set_hl(0, 'StatusLineNonText', {
                fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
                bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
            })

            -- Hide the characters in CursorLineBg
            vim.api.nvim_set_hl(0, 'CursorLineBg', {
                fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
                bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
            })

            vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
            vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
        end,
    })

    use('christoomey/vim-tmux-navigator')
    use('farmergreg/vim-lastplace')
    use('tpope/vim-commentary')
    use('tpope/vim-repeat')
    use('tpope/vim-surround')
    use('tpope/vim-eunuch') -- Adds :Rename, :SudoWrite
    use('tpope/vim-unimpaired') -- Adds [b and other handy mappings
    use('tpope/vim-sleuth') -- Indent autodetection with editorconfig support
    use('jessarcher/vim-heritage') -- Automatically create parent dirs when saving
    use('nelstrom/vim-visual-star-search')
    -- use { 'posva/vim-vue' }


    use({
        'voldikss/vim-floaterm',
        config = function()
            require('user.plugins.floaterm')
        end,
    })

    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        },
        config = function()
            require('user.plugins.telescope')
        end,
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
            require('user.plugins.treesitter')
        end,
    })

    use({
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb',
    })

    -- vimtex
    use 'lervag/vimtex'

    -- statusline
    use 'vim-airline/vim-airline'
    
    use({
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'onedark.nvim',
        config = function()
            require('user.plugins.bufferline')
        end,
    })

    use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('user.plugins.nvim-tree')
        end,
    })

    use('mbbill/undotree')

end)
