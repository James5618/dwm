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

## FreeBSD

This is the `freebsd` branch, built and installed the same way on FreeBSD 15.
It differs from `master` only in what the platform forces:

- headers and libraries come from `/usr/local` rather than `/usr/X11R6`
- `-lutil` is linked and `<sys/user.h>`/`<libutil.h>` included, so the swallow
  patch can read a process's parent with `kinfo_getproc(3)` instead of `/proc`
- `_XOPEN_SOURCE` is not defined, since it hides the BSD namespace that
  `<sys/user.h>` needs
- `install -D` (a GNU extension) is not used in the Makefile

- the status bar is found with `pgrep` and restarted with `pkill`, since
  `pidof` is not in the base system and BSD `killall` has no `-q`
- the volume keybindings signal dwmblocks by number: `SIGRTMIN` is 65 here,
  not 34, and `kill(1)` cannot name real-time signals at all
- the brightness keys use `backlight(8)` from the base system instead of
  `xbacklight`
- the volume keys drive `mixer(8)` and open `mixertui`, since the base audio
  is OSS and there is no sound server to ask
- `wincornerradius` can round window corners in dwm itself, with XShape, the
  same way the bar islands are shaped. It defaults to 0: picom rounds corners
  on the xrender backend perfectly well, so the compositor keeps the job and
  windows keep their shadows. Set it non-zero for a session with no compositor
  at all - the mask is one bit deep either way, so the curve is stepped rather
  than antialiased. Only the GL backends blend it, and that needs a DRM device
  FreeBSD has not provided under VMware since vmwgfx was dropped

Build dependencies: `pkg install xorg libX11 libXft libXinerama libXext
libxcb fontconfig freetype2 pkgconf`.
