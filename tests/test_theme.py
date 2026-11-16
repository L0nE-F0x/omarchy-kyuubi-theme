"""Validate the Kyuubi Omarchy theme: palette contrast, shell tokens, assets, shaders, and Neovim."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import tomllib
import unittest

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]


def luminance(hex_color: str) -> float:
    values = [int(hex_color[i:i + 2], 16) / 255 for i in (1, 3, 5)]
    linear = [v / 12.92 if v <= 0.04045 else ((v + 0.055) / 1.055) ** 2.4 for v in values]
    return sum(v * w for v, w in zip(linear, (0.2126, 0.7152, 0.0722)))


def contrast(a: str, b: str) -> float:
    lo, hi = sorted((luminance(a), luminance(b)))
    return (hi + 0.05) / (lo + 0.05)


class KyuubiThemeTests(unittest.TestCase):
    def test_wallpaper_untouched_and_valid_4k(self):
        bgs = sorted((ROOT / "backgrounds").iterdir())
        self.assertEqual([p.name for p in bgs], ["01-crimson-chakra.jpg"])
        with Image.open(bgs[0]) as img:
            self.assertEqual(img.size, (3840, 2160))
            self.assertEqual(img.mode, "RGB")
            img.verify()

    def test_palette_wcag_aa_contrast_and_ansi_aliases(self):
        colors = tomllib.loads((ROOT / "colors.toml").read_text())
        self.assertEqual(colors["mode"], "dark")
        for bg_key in ("background", "lighter_background"):
            for fg_key in (
                "foreground", "bright_foreground", "light_foreground", "dark_foreground",
                "muted", "accent", "red", "green", "yellow", "blue", "magenta", "cyan",
                "orange", "brown",
            ):
                ratio = contrast(colors[fg_key], colors[bg_key])
                self.assertGreaterEqual(ratio, 4.5, f"{fg_key} vs {bg_key} contrast {ratio:.2f} < 4.5")

        self.assertGreaterEqual(
            contrast(colors["selection_foreground"], colors["selection_background"]),
            4.5,
        )

        expected = [
            "background", "red", "green", "yellow", "blue", "magenta", "cyan", "foreground",
            "muted", "bright_red", "bright_green", "bright_yellow", "bright_blue",
            "bright_magenta", "bright_cyan", "bright_foreground",
        ]
        for idx, role in enumerate(expected):
            self.assertEqual(colors[f"color{idx}"], colors[role])

    def test_shell_toml_valid_and_no_dead_sections(self):
        shell = tomllib.loads((ROOT / "shell.toml").read_text())
        self.assertNotIn("launcher", shell)
        for section in ("bar", "hyprland", "controls", "popups", "tooltip", "notifications", "menu", "polkit", "lock", "image-picker"):
            self.assertIn(section, shell)
        lock = shell["lock"]
        self.assertGreaterEqual(contrast(lock["placeholder"], lock["background"]), 4.5)
        self.assertGreaterEqual(contrast(lock["text"], lock["background"]), 7.0)

    def test_unlock_and_previews(self):
        with Image.open(ROOT / "unlock.png") as unlock:
            self.assertEqual(unlock.mode, "RGBA")
            self.assertLessEqual(unlock.height, 460, "unlock.png too tall for 1080p Plymouth layout")
            alpha = unlock.getchannel("A")
            lo, hi = alpha.getextrema()
            self.assertEqual(lo, 0, "unlock.png must have transparent background")
            self.assertEqual(hi, 255)

        for name in ("preview.png", "preview-unlock.png"):
            with Image.open(ROOT / name) as img:
                self.assertEqual(img.size, (1920, 1080))
                self.assertEqual(img.mode, "RGB")
                img.verify()

    def test_branding_ascii_dimensions_and_glyphs(self):
        for name in ("about.txt", "about-fox.txt", "about-leaf.txt"):
            lines = (ROOT / "branding" / name).read_text().splitlines()
            self.assertEqual(len(lines), 26, name)
            for line in lines:
                vis = line.replace("$1", "").replace("$2", "").replace("$3", "")
                self.assertLessEqual(len(vis), 54, (name, len(vis)))
                for ch in vis:
                    self.assertFalse(0x2800 <= ord(ch) <= 0x28FF, f"Braille char in {name}")

        ff = json.loads((ROOT / "fastfetch/kyuubi-about.jsonc").read_text())
        text_dump = json.dumps(ff)
        self.assertNotIn("omarchy-show-logo", text_dump)
        self.assertIn("omarchy-version-pkgs", text_dump)
        self.assertIn("about.days", text_dump)

    @unittest.skipUnless(shutil.which("glslangValidator"), "glslangValidator not installed")
    def test_chakra_ember_shader_compiles(self):
        with tempfile.TemporaryDirectory() as tmpdir:
            frag = Path(tmpdir) / "chakra.frag"
            frag.write_text(
                "#version 330 core\n"
                "uniform vec3 iResolution;\n"
                "uniform sampler2D iChannel0;\n"
                "out vec4 color;\n"
                + (ROOT / "extras/chakra-ember.glsl").read_text()
                + "\nvoid main() { mainImage(color, gl_FragCoord.xy); }\n"
            )
            res = subprocess.run(["glslangValidator", "-S", "frag", str(frag)], capture_output=True, text=True)
            self.assertEqual(res.returncode, 0, res.stdout + res.stderr)

    @unittest.skipUnless(shutil.which("ghostty"), "ghostty not installed")
    def test_kyuubi_terminal_launcher(self):
        res = subprocess.run([str(ROOT / "scripts/kyuubi-terminal"), "--ember", "--check"], capture_output=True, text=True)
        self.assertEqual(res.returncode, 0, res.stdout + res.stderr)

    @unittest.skipUnless(shutil.which("nvim"), "nvim not installed")
    def test_neovim_lua_applies_kyuubi_highlights(self):
        aether_dir = Path.home() / ".local/share/nvim/lazy/aether"
        if not aether_dir.exists():
            self.skipTest("aether.nvim not installed")
        lua = (
            f"vim.opt.rtp:prepend({str(aether_dir)!r})\n"
            f"local spec = dofile({str(ROOT / 'neovim.lua')!r})\n"
            "require('aether').setup(spec[1].opts)\n"
            "vim.cmd('colorscheme aether')\n"
            "local function hex(name) local h = vim.api.nvim_get_hl(0, {name=name, link=false}); return h.fg and string.format('#%06X', h.fg) or '' end\n"
            "print(hex('Keyword') .. '|' .. hex('Function') .. '|' .. hex('String') .. '|' .. hex('Type'))\n"
        )
        with tempfile.NamedTemporaryFile("w", suffix=".lua", delete=False) as tf:
            tf.write(lua)
            tf_path = tf.name
        try:
            res = subprocess.run(
                ["nvim", "--headless", "-u", "NONE", "-c", f"luafile {tf_path}", "-c", "qa!"],
                capture_output=True, text=True, check=True,
            )
            out = (res.stdout + res.stderr).strip().splitlines()[-1]
            self.assertEqual(out, "#F04A58|#F26B1D|#92B46E|#F0B429")
        finally:
            os.unlink(tf_path)


if __name__ == "__main__":
    unittest.main()
