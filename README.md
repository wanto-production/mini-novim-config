# Neovim Configuration with mini.nvim

This is a personal Neovim configuration that uses the `mini.nvim` framework. It's designed to be lightweight and fast, with a focus on modern development workflows.

## Features

- **Plugin Management**: Uses `mini.deps` for managing plugins.
- **LSP**: Configured with `nvim-lspconfig` for language-specific features.
- **Completion**: Basic completion setup.
- **UI**: Customized with `lualine` and `catppuccin`.

## Plugins

This configuration uses the following plugins:

- [mini.nvim](https://github.com/nvim-mini/mini.nvim): A lightweight and fast Neovim framework.
- [oil.nvim](https://github.com/stevearc/oil.nvim): A file explorer.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): For syntax highlighting and parsing.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): A fuzzy finder.
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim): A Telescope extension for UI selection.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): A library of useful Lua functions.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configurations for the Neovim LSP client.
- [mason.nvim](https://github.com/mason-org/mason.nvim): A package manager for LSP servers, DAP servers, linters, and formatters.
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): A snippet engine.
- [nvim-dap](https://github.com/mfussenegger/nvim-dap): A debug adapter protocol implementation.
- [blink.cmp](https://github.com/Saghen/blink.cmp): A completion source for `nvim-cmp`.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A statusline plugin.
- [catppuccin/nvim](https://github.com/catppuccin/nvim): A theme.
- [noice.nvim](https://github.com/folke/noice.nvim): A plugin for improved Neovim messages.
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim): A UI component library.
- [conform.nvim](https://github.com/stevearc/conform.nvim): A code formatter.
- [which-key.nvim](https://github.com/folke/which-key.nvim): A plugin that displays a popup with possible keybindings.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim): A terminal manager.
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): A plugin for displaying buffers in a line.
- [markview.nvim](https://github.com/OXY2DEV/markview.nvim): A Markdown previewer.
- [vimtex](https://github.com/lervag/vimtex): A filetype and syntax plugin for LaTeX.
- [cord.nvim](https://github.com/vyfor/cord.nvim): A Discord Rich Presence plugin.

## Key Mappings

### General

| Key | Description |
|---|---|
| `<leader>sf` | Find files with Telescope. |
| `<leader>sd` | Show diagnostics with Telescope. |
| `<leader>q` | Open diagnostic quickfix list. |
| `<leader>e` | Open mini explorer (Oil). |
| `<leader>bd` | Delete buffer. |
| `<leader>bD` | Delete buffer (force). |
| `[b` | Previous buffer. |
| `]b` | Next buffer. |
| `<leader>r` | Format buffer with `conform.nvim`. |
| `<C-s>` | Save file. |

### Terminal

| Key | Description |
|---|---|
| `<Esc><Esc>` | Exit terminal mode. |

### Movement

| Key | Description |
|---|---|
| `<C-h>` | Move focus to the left window. |
| `<C-l>` | Move focus to the right window. |
| `<C-j>` | Move focus to the down window. |
| `<C-k>` | Move focus to the up window. |
| `<A-Up>` | Move line up. |
| `<A-Down>` | Move line down. |

## Installation

1.  Clone this repository to your Neovim configuration directory:
    ```bash
    git clone <repository_url> ~/.config/nvim
    ```
2.  Start Neovim. `mini.nvim` will be installed automatically.
3.  The rest of the plugins will be installed by `mini.deps`.

**Note**: You may need to install the language servers you use with Mason (`:Mason`).
