# MacOS install

## Install Homebrew

https://brew.sh/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install zsh

```bash
brew install zsh
```

## Instal Oh My ZSH

https://ohmyz.sh/

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Plugin manager for ZSH

https://github.com/zplug/zplug

```bash
zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
```

## Install powerlevel9k theme

https://github.com/Powerlevel9k/powerlevel9k

```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
