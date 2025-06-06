---@diagnostic disable: missing-fields
return {
    "rose-pine/neovim",
    config = function()
        require("rose-pine").setup({
            variant = "main", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
                terminal = false,
                legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },

            groups = {
                border = "rounded",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                -- Comment = { fg = "foam" },
                VertSplit = { fg = "muted", bg = "muted" },
                HorSplit = { fg = "muted", bg = "muted" },
            },

            before_highlight = function(_, highlight, palette)
                -- 	-- Disable all undercurls
                -- 	if highlight.undercurl then
                -- 		highlight.undercurl = false
                -- 	end

                -- Change palette colour
                if highlight.fg == palette.pine then
                    highlight.fg = palette.foam
                end
            end,
        })
        vim.cmd("colorscheme rose-pine")
        -- vim.cmd("highlight Normal guibg=none")
        -- vim.cmd("highlight NonText guibg=none")
        -- vim.cmd("highlight Normal ctermbg=none")
        -- vim.cmd("highlight NonText ctermbg=none")
    end,
}
