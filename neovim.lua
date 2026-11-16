-- Kyuubi Neovim: Aether v3 tuned with Kurama semantic highlight lanes.
-- Keywords & control flow in bijuu crimson, functions & calls in chakra orange,
-- types & constants in ember gold, strings in Konoha moss-sage, comments in warm ash.
return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { bold = true },
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      colors = {
        bg = "#160C0B",
        dark_bg = "#100807",
        darker_bg = "#090505",
        lighter_bg = "#261411",

        fg = "#FCE6C8",
        dark_fg = "#BE9779",
        light_fg = "#E3C19E",
        bright_fg = "#FFF4E4",
        muted = "#A37B64",

        red = "#F04A58",
        yellow = "#F0B429",
        orange = "#F26B1D",
        green = "#92B46E",
        cyan = "#78AEBB",
        blue = "#7C9BC8",
        magenta = "#DE6B8A",
        brown = "#CA7642",

        bright_red = "#FF707C",
        bright_yellow = "#FFD46B",
        bright_green = "#BCD982",
        bright_cyan = "#A4CCD4",
        bright_blue = "#A0BAE0",
        bright_magenta = "#F08EA8",

        accent = "#F26B1D",
        cursor = "#F26B1D",
        foreground = "#FCE6C8",
        background = "#160C0B",
        selection = "#521D15",
        selection_foreground = "#FFF4E4",
        selection_background = "#521D15",
      },
      on_highlights = function(hl, c)
        -- Kurama syntax hierarchy
        hl.Keyword = { fg = c.red, bold = true, italic = true }
        hl.Conditional = { fg = c.red, bold = true, italic = true }
        hl.Repeat = { fg = c.red, bold = true, italic = true }
        hl.Exception = { fg = c.bright_red, bold = true }
        hl.Statement = { fg = c.red, bold = true }
        hl.Include = { fg = c.magenta, bold = true }

        hl["@keyword"] = { link = "Keyword" }
        hl["@keyword.function"] = { fg = c.red, bold = true, italic = true }
        hl["@keyword.return"] = { fg = c.bright_red, bold = true, italic = true }
        hl["@keyword.conditional"] = { link = "Conditional" }
        hl["@keyword.repeat"] = { link = "Repeat" }
        hl["@keyword.import"] = { link = "Include" }
        hl["@keyword.operator"] = { fg = c.magenta }

        hl.Function = { fg = c.orange, bold = true }
        hl["@function"] = { fg = c.orange, bold = true }
        hl["@function.call"] = { fg = "#FF8438" }
        hl["@function.method"] = { fg = c.orange, bold = true }
        hl["@function.method.call"] = { fg = "#FF8438" }
        hl["@function.builtin"] = { fg = c.bright_yellow, bold = true }
        hl["@constructor"] = { fg = c.yellow, bold = true }

        hl.Type = { fg = c.yellow, bold = true }
        hl["@type"] = { fg = c.yellow, bold = true }
        hl["@type.builtin"] = { fg = c.bright_yellow }
        hl["@module"] = { fg = c.blue, italic = true }
        hl["@namespace"] = { fg = c.blue, italic = true }

        hl.String = { fg = c.green }
        hl["@string"] = { fg = c.green }
        hl["@string.escape"] = { fg = c.bright_yellow, bold = true }
        hl["@string.regexp"] = { fg = c.bright_cyan }
        hl.Number = { fg = c.bright_yellow }
        hl.Boolean = { fg = c.bright_magenta, bold = true }
        hl.Constant = { fg = c.bright_yellow }
        hl["@constant.builtin"] = { fg = c.bright_magenta, bold = true }

        hl.Identifier = { fg = c.fg }
        hl["@variable"] = { fg = c.fg }
        hl["@variable.parameter"] = { fg = c.cyan, italic = true }
        hl["@variable.member"] = { fg = c.light_fg }
        hl["@property"] = { fg = c.cyan }
        hl["@variable.builtin"] = { fg = c.magenta, italic = true }
        hl.Operator = { fg = c.dark_fg }
        hl["@operator"] = { fg = c.dark_fg }
        hl["@punctuation.bracket"] = { fg = c.dark_fg }
        hl["@punctuation.delimiter"] = { fg = c.muted }

        -- Editor & chrome polish
        hl.CursorLine = { bg = "#22110E" }
        hl.CursorColumn = { bg = "#22110E" }
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = "#7A5A48" }
        hl.Visual = { bg = c.selection }
        hl.VisualNOS = { bg = c.selection }
        hl.Search = { bg = "#5C3A10", fg = c.bright_yellow, bold = true }
        hl.IncSearch = { bg = c.orange, fg = c.darker_bg, bold = true }
        hl.CurSearch = { bg = c.yellow, fg = c.darker_bg, bold = true }
        hl.MatchParen = { fg = c.bright_yellow, bg = "#4A1E14", bold = true, underline = true }

        hl.WinSeparator = { fg = "#4E2319" }
        hl.VertSplit = { fg = "#4E2319" }
        hl.NormalFloat = { bg = c.dark_bg, fg = c.fg }
        hl.FloatBorder = { bg = c.dark_bg, fg = c.orange }
        hl.FloatTitle = { bg = c.dark_bg, fg = c.yellow, bold = true }
        hl.Pmenu = { bg = c.dark_bg, fg = c.fg }
        hl.PmenuSel = { bg = c.selection, fg = c.bright_fg, bold = true }
        hl.PmenuThumb = { bg = c.brown }

        hl.TelescopeBorder = { fg = c.orange, bg = c.dark_bg }
        hl.TelescopePromptBorder = { fg = c.yellow, bg = c.dark_bg }
        hl.SnacksPickerBorder = { fg = c.orange, bg = c.dark_bg }
        hl.SnacksPickerInputBorder = { fg = c.yellow, bg = c.dark_bg }
        hl.NeoTreeWinSeparator = { fg = "#3D1D15", bg = c.dark_bg }
        hl.WhichKeyBorder = { fg = c.orange, bg = c.dark_bg }

        -- Diagnostics & Git signs
        hl.DiagnosticError = { fg = c.bright_red }
        hl.DiagnosticWarn = { fg = c.yellow }
        hl.DiagnosticInfo = { fg = c.blue }
        hl.DiagnosticHint = { fg = c.cyan }
        hl.GitSignsAdd = { fg = c.green }
        hl.GitSignsChange = { fg = c.yellow }
        hl.GitSignsDelete = { fg = c.red }

        -- Markdown headings
        hl["@markup.heading.1.markdown"] = { fg = c.orange, bold = true }
        hl["@markup.heading.2.markdown"] = { fg = c.yellow, bold = true }
        hl["@markup.heading.3.markdown"] = { fg = c.red, bold = true }
        hl["@markup.heading.4.markdown"] = { fg = c.green, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
