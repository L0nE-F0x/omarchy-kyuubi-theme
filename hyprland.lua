-- Kyuubi: chakra-orange → crimson-eye → ember-gold border, slowly rotating.
-- Ember glow on the focused window. A 2px border so the fire gradient can be seen
-- even if the user's looknfeel has zeroed general.border_size.
-- Local / non-git installs only: a theme cloned with .git cannot ship Lua.

local active_border_color = {
  colors = { "rgba(f26b1dee)", "rgba(c41e3aee)", "rgba(f0b429ee)", "rgba(f26b1dee)" },
  angle = 45,
}
local inactive_border_color = "rgba(3a2218aa)"

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
  },
  decoration = {
    shadow = {
      enabled = true,
      range = 14,
      render_power = 3,
      color = "rgba(f26b1d66)",
      color_inactive = "rgba(1a0c0880)",
    },
  },
})

hl.animation({ leaf = "borderangle", enabled = true, speed = 80, bezier = "linear", style = "loop" })
