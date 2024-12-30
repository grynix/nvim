return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		compile = { enabled = true, path = vim.fn.stdpath("cache") .. "/catppuccin", suffix = "_compiled" },
		opts = {
			flavour = "mocha",
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = { enabled = true, style = "nvchad" },
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
			color_overrides = {
				mocha = {
					rosewater = "#efc9c2",
					flamingo = "#BB9AF7",
					pink = "#BA99F5",
					mauve = "#b889f4",
					red = "#DF6C83",
					maroon = "#E0AF68", -- This is opts in a fn
					peach = "#FF9E64",
					yellow = "#f5c462",
					green = "#96d382",
					-- teal = "#0DB9D7", -- we'll need this in the future; future me: the color?
					teal = "#1ABC9C",
					sky = "#91d7e3",
					sapphire = "#68bae0",
					blue = "#739df2",
					lavender = "#73DACA",
					text = "#C0CAF5",
					subtext1 = "#a6b0d8",
					subtext0 = "#959ec2",
					overlay2 = "#848cad",
					overlay1 = "#717997",
					overlay0 = "#63677f",
					surface2 = "#505469",
					surface1 = "#3e4255",
					surface0 = "#2c2f40",
					base = "#1a1c2a",
					baseMantle = "#181924",
					mantle = "#16161E",
					crust = "#0e0f16",
				},
			},
			custom_highlights = function(colors)
				local O = require("catppuccin").options
				local active_bg = O.transparent_background and colors.none or colors.baseMantle
				local inactive_bg = O.transparent_background and colors.none or colors.baseMantle
				return {
					FlashLabel = {
						fg = "white",
						bg = "#FF007C",
					},
					-- NeoTree
					NeoTreeDirectoryName = { fg = colors.blue },
					NeoTreeDirectoryIcon = { fg = colors.blue },
					NeoTreeNormal = { fg = colors.text, bg = active_bg },
					NeoTreeNormalNC = { fg = colors.text, bg = active_bg },
					NeoTreeExpander = { fg = colors.overlay0 },
					NeoTreeIndentMarker = { fg = colors.overlay0 },
					NeoTreeRootName = { fg = colors.blue, style = { "bold" } },
					NeoTreeSymbolicLinkTarget = { fg = colors.pink },

					NeoTreeGitAdded = { fg = colors.green },
					NeoTreeGitConflict = { fg = colors.red },
					NeoTreeGitDeleted = { fg = colors.red },
					NeoTreeGitIgnored = { fg = colors.overlay0 },
					NeoTreeGitModified = { fg = colors.yellow },
					NeoTreeGitUnstaged = { fg = colors.red },
					NeoTreeGitUntracked = { fg = colors.mauve },
					NeoTreeGitStaged = { fg = colors.green },

					NeoTreeFloatBorder = { link = "FloatBorder" },
					NeoTreeFloatTitle = { link = "FloatTitle" },
					NeoTreeTitleBar = { fg = colors.mantle, bg = colors.blue },

					NeoTreeFileNameOpened = { fg = colors.pink },
					NeoTreeDimText = { fg = colors.overlay1 },
					NeoTreeFilterTerm = { fg = colors.green, style = { "bold" } },
					NeoTreeTabActive = { bg = active_bg, fg = colors.lavender, style = { "bold" } },
					NeoTreeTabInactive = { bg = inactive_bg, fg = colors.overlay0 },
					NeoTreeTabSeparatorActive = { fg = active_bg, bg = active_bg },
					NeoTreeTabSeparatorInactive = { fg = inactive_bg, bg = inactive_bg },
					NeoTreeVertSplit = { fg = colors.base, bg = inactive_bg },
					NeoTreeStatusLineNC = { fg = colors.mantle, bg = colors.mantle },

					-- treesitter_context
					TreesitterContext = {
						sp = colors.base,
						bg = colors.surface1,
					},
					TreesitterContextBottom = {
						sp = colors.base,
						-- bg = colors.surface1,
					},
					TreesitterContextLineNumber = {
						bg = colors.base,
					},

					-- LazyGit
					LazyGitFloat = { bg = "black" },
					LazyGitBorder = { bg = "black" },

					-- Lsp
					LspInlayHint = { bg = colors.surface0, fg = colors.overlay1, style = { "italic" } },
					SupermavenSuggestion = { fg = "#7b818a" },
				}
			end,
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
