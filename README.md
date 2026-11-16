# Kyuubi

Nine tails. Unsealed.

An original dark [Omarchy](https://omarchy.org) theme inspired by Kurama, the
Nine-Tails, from Naruto. Warm seal-black, Kurama chakra orange, crimson eyes,
ember gold, and pale cream text.

This is unofficial fan-made work. Naruto and Kurama belong to their respective
rights holders; this theme is not official artwork or an endorsed product.

## Palette

| Role | Hex |
| --- | --- |
| Seal-black background | `#160C0B` |
| Chakra orange | `#F26B1D` |
| Crimson eye | `#C41E3A` |
| Ember gold | `#F0B429` |
| Parchment text | `#FFE8C8` |

`colors.toml` is the source of truth. Omarchy generates app configs from it.
This pack also ships:

- a rotating orange → crimson → gold Hyprland border with a soft ember glow
- a slightly translucent terminal background so the wallpaper can show through
- btop meters in fire colours
- Quickshell bar / launcher / menu / notification / lock chrome in the same palette
- `unlock.png` with a fan-made Eight Trigrams Seal over the standing-fox wallpaper
- an optional About logo — the Eight Trigrams Seal, or a Konoha leaf — see `branding/`

On a theme installed from git, Omarchy ignores Lua and terminal configs
(`hyprland.lua`, `neovim.lua`, `ghostty.conf`, `kitty.conf`, `alacritty.toml`).
The palette, `shell.toml`, `btop.theme`, icons, and images still apply. Copying
those Lua and terminal files into a local (non-git) install lets the animated
border, nvim highlights, and terminal opacity take effect.

## Wallpaper

Original generated artwork — not an official screenshot or manga panel — at 3840×2160:

- **Crimson Chakra** (`backgrounds/01-crimson-chakra.jpg`) — Kyuubi standing with all nine tails behind him and a scarlet bijuu aura.

## About logo (optional)

Omarchy's About screen reads a **user-level** file, not a per-theme one:

`~/.config/omarchy/branding/about.txt`

Nothing in `branding/` is applied automatically. To use the Eight Trigrams
Seal (Hakke no Fūin Shiki) as the About logo:

```sh
cp ~/.config/omarchy/themes/kyuubi/branding/about.txt ~/.config/omarchy/branding/about.txt
# optional, so $1/$2/$3 map to chakra orange, crimson, and gold:
# mkdir -p ~/.config/fastfetch
# cp ~/.config/omarchy/themes/kyuubi/fastfetch/kyuubi-about.jsonc ~/.config/fastfetch/config.jsonc
omarchy-launch-about
```

`branding/about-leaf.txt` is the Konoha leaf, if you prefer that instead.
Restore the default Omarchy mark with `omarchy branding about reset`.

Because the logos use `$1`/`$2`/`$3`, the About sheen animation will not run.
That is a trade for a three-colour logo.

## License

Theme files are MIT licensed (see [LICENSE](LICENSE)).

Backgrounds are original generated fan art. Naruto and Kurama remain the property of their rights holders.
