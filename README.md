# Dotfiles

My dotfiles. Public Domain.

## Instructions

- This repo should be in `$HOME` under the `.neko/` folder
- Run `./requirements.sh` to install (some of) the required packages. (Assumes Arch Linux for now.)
	- Requires npm & nodejs for some of the RSS functionality. (the requirements.sh script doesn't handle npm installation. Use `nvm`)
- Run `./install.sh` to install this repo's `.bashrc`

```bash
git clone https://github.com/Nekohime/dotfiles ~/.neko
bash ~/.neko/requirements.sh
bash ~/.neko/install.sh
```
