--------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
--------------------------------------------------

options = { noremap = true }

vim.g.mapleader = ','
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- disable esc
map ('i','<esc>','<nop>',options)

-- clear search highlighting 
map('n', '<leader>c', ':nohl<CR>',options)

-- save document
map('n','<leader>w',':w<CR>',options)

-- quit document
map ('n','<leader>q',':q<CR>',options)

-- quit insert mode
map('i','jk','<esc>',options)

-- split current window
map ('n','<leader>n',':vne<cr>',options)

-- move to left window 
map ('n','<leader>l','<c-w>l',options)

-- move to right window 
map ('n','<leader>h','<c-w>h',options)

-- swipe actual window to the opposite side
map ('n','<leader>x','<c-w>x',options)
