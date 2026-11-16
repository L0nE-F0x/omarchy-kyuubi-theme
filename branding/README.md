# Kyuubi About Branding (Optional)

Omarchy's About screen reads a user-level logo at `~/.config/omarchy/branding/about.txt`
and optional user fastfetch config at `~/.config/fastfetch/config.jsonc`.

## Included Marks (54x26 Quadrant-Block Art)

All three marks use standard Unicode quadrant blocks (`▀▄█▛▜` — zero Braille glyphs,
so they render cleanly in DejaVu Sans Mono and JetBrainsMono Nerd Font) with
fastfetch palette slots `$1` (chakra orange), `$2` (bijuu crimson), and `$3` (ember gold):

- `about.txt` — **Eight Trigrams Seal (Hakke no Fūin Shiki)**: central chakra spiral,
  gold seal ring, and eight crisp trigram marks.
- `about-fox.txt` — **Kurama Crest**: stylized Nine-Tails kitsune head with glowing
  crimson Sharingan eyes and golden forehead seal.
- `about-leaf.txt` — **Konoha Leaf**: Hidden Leaf emblem with open spiral slit and gold stem.

`fastfetch/kyuubi-about.jsonc` keeps all native Omarchy modules (`Channel`, `Theme`
color dots, `OS Age`, `Uptime`, `Update`) while mapping `$1`/`$2`/`$3` to
`#F26B1D` / `#F04A58` / `#F0B429`.

## Apply or Switch Mark

```sh
cp ~/.config/omarchy/themes/kyuubi/branding/about.txt ~/.config/omarchy/branding/about.txt
# or: cp ~/.config/omarchy/themes/kyuubi/branding/about-fox.txt ~/.config/omarchy/branding/about.txt
# or: cp ~/.config/omarchy/themes/kyuubi/branding/about-leaf.txt ~/.config/omarchy/branding/about.txt

mkdir -p ~/.config/fastfetch
cp ~/.config/omarchy/themes/kyuubi/fastfetch/kyuubi-about.jsonc ~/.config/fastfetch/config.jsonc
omarchy-launch-about
```

Restore the default Omarchy mark with `omarchy branding about reset`.
