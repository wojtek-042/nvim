-- Set map leader to space
vim.g.mapleader = " "

-- for leader+pv to execute the Ex command
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Workaround for basic formatting
vim.keymap.set('n', '<leader>df', 'ggVGgq')

vim.keymap.set('n', '<F8>', ':w <CR> :!gcc % -o %< && ./%< <CR>')

-- for J to move the selection down one line and reselect
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- for K to move the selection up one line and reselect
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- for J to join the current line with the one below and reposition cursor
vim.keymap.set("n", "J", "mzJ`z")

-- for Ctrl+d to scroll down half a screen and reposition cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- for Ctrl+u to scroll up half a screen and reposition cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- for n to move to the next match, center the screen, and reselect
vim.keymap.set("n", "n", "nzzzv")

-- for N to move to the previous match, center the screen, and reselect
vim.keymap.set("n", "N", "Nzzzv")

-- for leader+p to copy and replace the selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

--  normal and  for leader+y to copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- for leader+Y to copy the entire buffer to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

--  normal and  for leader+d to delete selected text
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--  insert mode for Ctrl+c to exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- for Q to do nothing
vim.keymap.set("n", "Q", "<nop>")

-- for Ctrl+f to open a new Tmux window with tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- for leader+f to format code with LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- Jump to next error in quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")     -- Jump to previous error in quickfix list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Jump to next location list item
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- Jump to previous location list item

-- Sets key mappings for search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace word under the cursor with input

-- Sets key mapping to add executable permission to the current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open Packer configuration file
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/freddie/packer.lua<CR>");

-- Run "make_it_rain" command in current directory
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- Sets key mapping to source the current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
