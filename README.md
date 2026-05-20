# Neovim Setup

## Usage Tips

- Trigger hover / intellisense: `K`
- After updating treesitter parsers: `:TSUpdate`
- Trigger LSP completion manually: `<C-Space>` *(see known issues below)*

---

## Known Issues

### `<C-Space>` LSP completion not working on macOS

**Symptom:** Pressing `<C-Space>` in insert mode does nothing — no completion menu appears.

**Cause:** macOS intercepts `Control+Space` at the OS level for switching input sources, so the keypress never reaches Neovim/Neovide.

**Fix:**
1. Open **System Settings** → **Keyboard** → **Keyboard Shortcuts** → **Input Sources**
2. Uncheck **"Select the previous input source"** (`⌃Space`)
3. Uncheck **"Select next source in Input menu"** (`⌃⌥Space`) if present
4. Click **Done** and restart Neovide

After this, `<C-Space>` will reach Neovim and trigger the completion menu correctly.
