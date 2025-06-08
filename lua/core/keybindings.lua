local map = require("core.utils.utils").map

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local enabled = require("core.utils.utils").enabled
vim.g.mapleader = " " -- the leader key is the spacebar
local M = {}

-- Image Pasting
if enabled(group, "img_paste") then
	map("n", "<leader>p", "<CMD>PasteImage<CR>", { desc = "Paste clipboard image" })
end

-- ZenMode
if enabled(group, "zen") then
	map("n", "<leader>zm", "<CMD>ZenMode<CR>")
end

-- -- NeoTree
-- if enabled(group, "neotree") then
	map("n", "<leader>e", "<CMD>OtreeFocus<CR>")
-- 	map("n", "<leader>nf", "<CMD>Neotree reveal float toggle<CR>")
-- end

-- Searching and Highlighting
map("n", "m", "<CMD>noh<CR>")

-- Movement
-- in insert mode, type <c-d> and your cursor will move past the next separator
-- such as quotes, parens, brackets, etc.
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><CMD>noh<cr><right>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")

-- Window switching from terminal
map("t", "<C-w>h", "<C-\\><C-n><C-w>h")
map("t", "<C-w>j", "<C-\\><C-n><C-w>j")
map("t", "<C-w>k", "<C-\\><C-n><C-w>k")
map("t", "<C-w>l", "<C-\\><C-n><C-w>l")

-- Command mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Telescope
if enabled(group, "telescope") then
	map("n", "<leader>tf", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find Files" })
	map("n", "<leader>tg", "<CMD>Telescope live_grep<CR>")
	map("n", "<leader>tb", "<CMD>Telescope buffers<CR>")
	map("n", "<leader>th", "<CMD>Telescope help_tags<CR>")
	map("n", "<leader>tp", "<CMD>Telescope projects<CR>")
end

-- Move lines and blocks
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Notify
if enabled(group, "notify") then
	map("n", "<ESC>", "<CMD>lua require('notify').dismiss()<CR>")
	map("i", "<ESC>", "<CMD>lua require('notify').dismiss()<CR><ESC>")
end

-- More LSP stuff
if enabled(group, "lsp_zero") then
	_G.buf = vim.lsp.buf
	-- lsp agnostic global rename
	map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "global substitution" })
	map("n", "gD", "<CMD>lua buf.declaration()<CR>")
	map("n", "gd", "<CMD>lua buf.definition()<CR>")
	map("n", "gi", "<CMD>lua buf.implementation()<CR>")
	map("n", "gr", "<CMD>Telescope lsp_references<CR>")
	map("n", "sh", "<CMD>lua buf.signature_help()<CR>")
	map("n", "<leader>rn", "<CMD>lua buf.rename()<CR>")
	map("n", "<leader>ca", "<CMD>lua buf.code_action()<CR>")
	map("n", "<C-k>", "<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>")
end

-- Aerial
if enabled(group, "aerial") then
	map("n", "<leader>at", "<CMD>AerialToggle<CR>")
end

-- Session
if enabled(group, "session_manager") then
	map("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>")
	map("n", "<leader>o", "<CMD>SessionManager load_session<CR>")
end

-- Lsp saga keybinds
map("n", "<leader>n", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous diagnostic" })
map("n", "<leader>p", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next diagnostic" })

-- Keybindings for code actions
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })
map("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to Definition" })
map("n", "<leader>\\", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal" })
map("t", "<leader>\\", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal" })


-- My keybinds

map("n", "<A-e>", "<C-w>h", { desc = "Navigate to the window on the left" })
map("n", "<A-r>", "<C-w>l", { desc = "Navigate to the window on the right" })

map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "<leader>k", ":bnext<CR>", { desc = "Go to next buffer" })
map("n", "<leader>j", ":bprev<CR>", { desc = "Go to previous buffer" })
map("n", "<leader>q", ":close<CR>", { desc = "Close buffer" })

map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Toggle comment on current line" })
map("v", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment on selected lines" })

-- cmp (these are defined in cmp's configuration file)
-- ["<C-j>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-k"] = cmp.mapping.scroll_docs(4),
-- ["<C-c>"] = cmp.mapping.abort(),
-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
return M
