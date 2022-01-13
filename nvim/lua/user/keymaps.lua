local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Unbind default bindings for arrow keys
keymap('v', '<up>', '<nop>', opts)
keymap('v', '<down>', '<nop>', opts)
keymap('v', '<left>', '<nop>', opts)
keymap('v', '<right>', '<nop>', opts)
keymap('i', '<up>', '<nop>', opts)
keymap('i', '<down>', '<nop>', opts)
keymap('i', '<left>', '<nop>', opts)
keymap('i', '<right>', '<nop>', opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers with L and H
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear search results
keymap("n", "<Leader><Space>", ":noh<CR>", opts)

-- Native forward search
keymap("n", "<Leader>f", "<kDivide>", { noremap = true })

-- Trim whitespace
keymap("n", "<Leader>w", ":%s/\\s\\+$//<CR>", opts)

-- Global replace
keymap("n", "<Leader>r", ":%s///g<left><left><left>", { noremap = true })

-- Global replace with confirm
keymap("n", "<Leader>c", ":%s///gc<left><left><left><left>", { noremap = true })

-- Toggle spelling
keymap("n", "<Leader>s", ":setlocal spell! spelllang=en_us<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep yanked stuff even after visual select
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

