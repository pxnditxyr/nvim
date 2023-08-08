# My Configurations of NeoVim | Lua

This repository contains my customized NeoVim configuration. It is optimized for my workflow and may be useful for other NeoVim users looking for a well-organized and easy-to-use configuration.

## Requirements

Before you can use this configuration, you will need to have NeoVim installed on your system. You can download NeoVim from the official website: https://neovim.io/.

## Installation

1. Clone this repository to your local machine using the following command:
   ```bash
   git clone https://github.com/pxnditxyr/nvim.git ~/.config/nvim
   ```

2. Install Lazy manually if it was not installed automatically, 
The package manager I use in this configuration, by following the steps in its repository: https://github.com/folke/lazy.nvim

3. Launch NeoVim with the following command:
   ```bash
   nvim
   ```

4. Wait for the plugins to be automatically installed with Lazy.

## Plugins

My NeoVim configuration includes the following plugins:
- [autopairs](https://github.com/windwp/nvim-autopairs)
- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [comment](https://github.com/numToStr/Comment.nvim)
- [copilot](https://github.com/github/copilot.vim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [leap](https://github.com/ggandor/leap.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [rest](https://github.com/rest-nvim/rest.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [tokyonight](https://github.com/folke/tokyonight.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)

## Keybindings

My NeoVim configuration includes customized keybindings.

If you want to add more customized keybindings, you can do so by editing the `lua/pxndxs/keymaps.lua` file and adding the keybindings in the corresponding section.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

If you want to contribute to this project, you are welcome to do so! Feel free to fork this repository and send a pull request with your improvements or bug fixes.
