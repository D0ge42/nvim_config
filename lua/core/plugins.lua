local enabled = require("core.utils.utils").enabled

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local plugins = exist and type(user_config) == "table" and user_config.plugins or {}
require("lazy").setup({
	{
		"stevearc/aerial.nvim",
		cond = enabled(group, "aerial"),
		cmd = "AerialToggle",
		config = function()
			require("plugin-configs.aerial")
		end,
	},
  {
    'nvimdev/lspsaga.nvim',
    lazy  = false,
    config = function()
        require('plugin-configs.lspsaga')
    end,
    },
	{
		"goolord/alpha-nvim",
		cond = enabled(group, "alpha"),
		lazy = false,
		config = function()
			require("plugin-configs.alpha")
		end,
	},
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
  },
	{
		"akinsho/bufferline.nvim",
		cond = enabled(group, "bufferline"),
		lazy = false,
		config = function()
			require("plugin-configs.bufferline")
		end,
	},
	{
		"stevearc/dressing.nvim",
		cond = enabled(group, "dressing"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.dressing")
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		cond = enabled(group, "img_clip"),
		event = "BufEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		cond = enabled(group, "indent_blankline"),
		event = "VimEnter",
		config = function()
			require("ibl").setup()
		end,
	},
  {
		"VonHeikemen/lsp-zero.nvim",
		cond = enabled(group, "lsp_zero"),
		event = "VimEnter",
		branch = "v3.x",
		config = function()
			require("mason").setup()
			require("plugin-configs.lsp")
		end,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"folke/neodev.nvim",
		cond = enabled(group, "neodev"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neodev")
		end,
	},
  {
		"rebelot/kanagawa.nvim",
		cond = enabled(group, "neodev"),
		lazy = false,
    config = function()
			require("plugin-configs.kanagawa")
		end,
	},
	{
		"karb94/neoscroll.nvim",
		cond = enabled(group, "neoscroll"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neoscroll")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		cond = enabled(group, "neotree"),
		event = "VeryLazy",
		config = function()
			require("plugin-configs.neo-tree")
		end,
		branch = "v3.x",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"Shatur/neovim-session-manager",
		cond = enabled(group, "session_manager"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.session")
		end,
	},
	{
		"folke/noice.nvim",
		cond = enabled(group, "noice"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.noice")
		end,
		dependencies = { { "MunifTanjim/nui.nvim" } },
	},
	{
		"nvimtools/none-ls.nvim",
		cond = enabled(group, "null_ls"),
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugin-configs.null-ls")
		end,
		dependencies = {
			{
				"jay-babu/mason-null-ls.nvim",
				cmd = { "NullLsInstall", "NullLsUninstall" },
				config = function()
					require("plugin-configs.mason-null-ls")
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		cond = enabled(group, "autopairs"),
		event = "InsertEnter",
		config = function()
			require("plugin-configs.autopairs")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		cond = enabled(group, "cmp"),
		event = "InsertEnter",
		config = function()
			require("plugin-configs.cmp")
		end,
		dependencies = {
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{ "NvChad/nvim-colorizer.lua", cond = enabled(group, "colorizer"), event = "VimEnter" },
	{
		"rcarriga/nvim-notify",
		cond = enabled(group, "notify"),
		lazy = false,
	},
	{
		"kylechui/nvim-surround",
		cond = enabled(group, "surround"),
		event = "VimEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		cond = enabled(group, "treesitter"),
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugin-configs.treesitter")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"nvim-treesitter/nvim-treesitter-context",
				cond = enabled(group, "context"),
				config = function()
					require("plugin-configs.treesitter-context")
				end,
			},
			{ "windwp/nvim-ts-autotag", cond = enabled(group, "autotag") },
			{ "HiPhish/rainbow-delimiters.nvim", cond = enabled(group, "rainbow") },
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
		},
	},
	{
		"navarasu/onedark.nvim",
		cond = enabled(group, "onedark"),
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"ahmedkhalf/project.nvim",
		cond = enabled(group, "project"),
		event = "VimEnter",
		config = function()
			require("project_nvim").setup()
		end,
	},
  -- {
  --   "Eutrius/Otree.nvim",
  --   lazy = false,
  --   dependencies = {
  --       "nvim-tree/nvim-web-devicons",
  --       "stevearc/oil.nvim",
  --   },
  --   config = function()
  --       require("Otree").setup()
  --   end
  -- },
	{
		"tiagovla/scope.nvim",
		cond = enabled(group, "scope"),
		event = "VimEnter",
		config = function()
			require("plugin-configs.scope")
		end,
	},
  {
		"sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {

    -- stiffness = 0.8,                      -- 0.6      [0, 1]
    -- trailing_stiffness = 0.5,             -- 0.4      [0, 1]
    -- stiffness_insert_mode = 0.6,          -- 0.4      [0, 1]
    -- trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    -- distance_stop_animating = 0.5,
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines.
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = true,
	}},
	{
		"nvim-telescope/telescope.nvim",
		cond = enabled(group, "telescope"),
		cmd = "Telescope",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("plugin-configs.telescope")
		end,
	},
	{
		"folke/twilight.nvim",
		cond = enabled(group, "twilight"),
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("plugin-configs.twilight")
		end,
	},
	{
		"folke/which-key.nvim",
		cond = enabled(group, "whichkey"),
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"windwp/windline.nvim",
		cond = enabled(group, "windline"),
		event = "VeryLazy",
		config = function()
			require("wlsample.evil_line")
		end,
	},
  {
  'sainnhe/sonokai',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.sonokai_enable_italic = true
        vim.cmd.colorscheme('sonokai')
      end
  },
	{
		"folke/zen-mode.nvim",
		cond = enabled(group, "zen"),
		cmd = "ZenMode",
		config = function()
			require("plugin-configs.zenmode")
		end,
	},
	plugins,
}, {
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
})

