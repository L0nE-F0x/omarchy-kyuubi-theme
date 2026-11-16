-- Kyuubi Hyprland chrome: seamless chakra-orange -> crimson -> ember-gold
-- border loop, themed window group bars, and warm Kurama ember aura.
-- Local / non-git installs only: a theme cloned with .git omits Lua files.

local active_border_color = {
  colors = {
    "rgba(f26b1dee)",
    "rgba(f04a58ee)",
    "rgba(f0b429ee)",
    "rgba(f04a58ee)",
    "rgba(f26b1dee)",
  },
  angle = 45,
}
local inactive_border_color = "rgba(3d2219aa)"

hl.config({
  general = {
    border_size = 2,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },
  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
    groupbar = {
      indicator_height = 2,
      text_color = "rgb(fff4e4)",
      text_color_inactive = "rgba(e3c19eaa)",
      col = {
        active = "rgba(f26b1dcc)",
        inactive = "rgba(261411aa)",
      },
    },
  },
  decoration = {
    shadow = {
      enabled = true,
      range = 18,
      render_power = 3,
      color = "rgba(f26b1d55)",
      color_inactive = "rgba(09050599)",
    },
  },
})

hl.animation({ leaf = "borderangle", enabled = true, speed = 65, bezier = "linear", style = "loop" })
