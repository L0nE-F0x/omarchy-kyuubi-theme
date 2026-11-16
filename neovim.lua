-- Kyuubi nvim: Aether palette tuned for chakra highlights.
-- Keywords/errors in crimson, strings in ember gold, functions in Kurama orange,
-- comments in warm ash. Local / non-git installs only; git installs regenerate
-- this file from colors.toml (same palette, without the comment).
return {
  {
    "omacom/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      colors = {
        bg = "#160C0B",
        dark_bg = "#100807",
        darker_bg = "#0A0605",
        lighter_bg = "#2A1610",

        fg = "#FFE8C8",
        dark_fg = "#B8957A",
        light_fg = "#E8C9A8",
        bright_fg = "#FFF3E0",
        muted = "#A07A62",

        red = "#C41E3A",
        yellow = "#F0B429",
        orange = "#F26B1D",
        green = "#8BA86A",
        cyan = "#7A9BA8",
        blue = "#5C6E8A",
        magenta = "#C45C58",
        brown = "#A65B32",

        bright_red = "#FF3B4E",
        bright_yellow = "#FFD36A",
        bright_green = "#C4D97A",
        bright_cyan = "#A8C4CC",
        bright_blue = "#8AA0C0",
        bright_magenta = "#E88980",

        accent = "#F26B1D",
        cursor = "#FFF3E0",
        foreground = "#FFE8C8",
        background = "#160C0B",
        selection = "#5A1E14",
        selection_foreground = "#FFF3E0",
        selection_background = "#5A1E14",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
