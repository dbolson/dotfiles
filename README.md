# dotfiles

## requirements

* python for `coq_nvim`
* [glow](https://github.com/charmbracelet/glow)
* [font](https://www.nerdfonts.com/) (specifically [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) )for `nvim-web-devicons`
* [fzy](https://github.com/jhawthorn/fzy) for telescope

## installation

```
git clone git@github.com:dbolson/dotfiles.git ~/dotfiles
cd ~/dotfiles
./bin/install
```

Run these commands in vim:

```
:PlugInstall
:COQdeps
:LspInstall bash
:LspInstall go
:LspInstall python
```
