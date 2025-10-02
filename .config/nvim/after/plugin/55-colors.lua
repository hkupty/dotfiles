require("kanagawa").setup({
	dimInactive = true,
	terminalColors = true,
	overrides = function(c)
		return {

			-- Statusline modes
			SLInsertMode = { bg = c.palette.lotusBlue4, fg = c.palette.sumiInk0 },
			SLNormalMode = { bg = c.palette.lotusViolet4, fg = c.palette.sumiInk0 },
			SLVisualMode = { bg = c.palette.lotusGreen, fg = c.palette.sumiInk0 },
			SLCommandMode = { bg = c.palette.waveRed, fg = c.palette.sumiInk0 },
			SLUnknownMode = { bg = c.palette.dragonOrange2, fg = c.palette.sumiInk0 },
			SLReplaceMode = { bg = c.palette.lotusViolet2, fg = c.palette.sumiInk0 },
			SLTerminalMode = { bg = c.palette.dragonBlack1, fg = c.palette.dragonWhite },

			-- Secondaries
			SLBlue = { bg = c.palette.lotusTeal2, fg = c.palette.sumiInk0 },
			SLViolet = { bg = c.palette.lotusViolet2, fg = c.palette.sumiInk0 },
			SLDarkGreen = { bg = c.palette.dragonGreen2, fg = c.palette.sumiInk0 },
			SLRed = { bg = c.palette.sakuraPink, fg = c.palette.sumiInk0 },
			SLOrange = { bg = c.palette.dragonYellow, fg = c.palette.sumiInk0 },
			SLPastelViolet = { bg = c.palette.lotusViolet1, fg = c.palette.sumiInk0 },
			SLBlack = { bg = c.palette.dragonBlack3, fg = c.palette.dragonWhite },

			-- statusline sections
			SLError = { bg = c.palette.dragonBlack3, fg = c.palette.peachRed },
			SLWarn = { bg = c.palette.dragonBlack3, fg = c.palette.surimiOrange },
			SLInfo = { bg = c.palette.dragonBlack3, fg = c.palette.dragonBlue2 },
			SLHint = { bg = c.palette.dragonBlack3, fg = c.palette.dragonGreen },
			SLText = { bg = c.palette.dragonBlack3, fg = c.palette.dragonWhite },
			SLLSP = { bg = c.palette.winterBlue, fg = c.palette.dragonWhite },
			SLHighlight = { fg = c.palette.lotusViolet2 },

			-- tabline
			TLInactive = { bg = c.palette.dragonBlack4, fg = c.palette.dragonBlack6 },
			TLActive = { bg = c.palette.springGreen, fg = c.palette.dragonBlack1 },

			Whitespace = { fg = c.palette.sumiInk2 },
		}
	end,
})

vim.cmd("colorscheme kanagawa-dragon")
