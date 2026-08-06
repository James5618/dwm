# dwm — my build

The window manager for my [bootstrap](https://github.com/james5618/bootstrap)
rice, deployed with my [dotfiles](https://github.com/james5618/dotfiles).

## Features and patches

- Catppuccin colors by default; reads
  [Xresources](https://dwm.suckless.org/patches/xresources/) colors/variables
  at startup (Super+F5 reloads them live, pywal compatible)
- [Clickable statusbar](https://dwm.suckless.org/patches/statuscmd/) with my
  build of [dwmblocks](https://github.com/james5618/dwmblocks)
- Scratchpads, sticky windows, true fullscreen (Super+F)
- Extra layouts: bstack, fibonacci, deck, centered master and more
  (Super+(Shift+)t/y/u/i)
- [vanitygaps](https://dwm.suckless.org/patches/vanitygaps/),
  [stacker](https://dwm.suckless.org/patches/stacker/),
  [shiftview](https://dwm.suckless.org/patches/nextprev/),
  [swallow](https://dwm.suckless.org/patches/swallow/)

Bindings live in [config.h](config.h).

## Installation

```sh
git clone https://github.com/james5618/dwm.git
cd dwm
sudo make install
```

A `PKGBUILD` is included for pacman distros: run `makepkg -si` instead.
