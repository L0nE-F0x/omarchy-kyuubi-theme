# Kyuubi About branding (optional)

Omarchy's About screen reads a **user-level** file:

`~/.config/omarchy/branding/about.txt`

That path is not per-theme. Nothing here is applied automatically when you
switch to Kyuubi.

## Files

- `about.txt` — the Eight Trigrams Seal (Hakke no Fūin Shiki): a two-turn
  central spiral ringed by eight brush-script trigram marks. Quadrant-block
  art (▀▄█▛▜ etc.; DejaVu Sans Mono has no Braille), 54×26, coloured with
  fastfetch `$1` (chakra orange spiral), `$2` (crimson marks), `$3` (gold ring).
- `about-leaf.txt` — the Konoha leaf: stem at the upper right, pointed tip at
  the lower left, spiral slit opening from the upper-left edge. Same
  quadrant-block grid and colour codes (`$1` for the leaf).

Because the files use `$1`/`$2`/`$3`, the About sheen animation will not run.
That is a trade for a three-colour logo. The system About config still tints
the logo ANSI green unless you also install the optional fastfetch config:

`fastfetch/kyuubi-about.jsonc` maps `$1` to chakra orange (208), `$2` to
crimson (196), `$3` to gold (220).

## Apply (only if you want it)

```sh
cp ~/.config/omarchy/themes/kyuubi/branding/about.txt ~/.config/omarchy/branding/about.txt
# optional:
# mkdir -p ~/.config/fastfetch
# cp ~/.config/omarchy/themes/kyuubi/fastfetch/kyuubi-about.jsonc ~/.config/fastfetch/config.jsonc
omarchy-launch-about
```

Restore the default Omarchy mark with `omarchy branding about reset`.
