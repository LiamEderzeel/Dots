<div align="center"><img src="assets/nixos-logo.png" width="300px"></div>
<h1 align="center">System Configuration</h1>

# Dots

## install

- `git clone --bare git@github.com:LiamEderzeel/Dots.git ~/.dots`
- `alias config='git --git-dir=$HOME/.dots/ --work-tree=$HOME'`
- `config config --local status.showUntrackedFiles no `
- `config checkout`
- `config remote remove origin`
- `config remote add origin git@github.com:LiamEderzeel/Dots.git`

## usage

- use `config` instead of `git`
- use `configlg` for lazygit

## sources

- https://www.atlassian.com/git/tutorials/dotfiles
- https://news.ycombinator.com/item?id=11071754
