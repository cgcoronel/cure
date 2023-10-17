# cure 

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
![version](https://img.shields.io/badge/version-v0.0.3-df5e88)

<img align="right"
     height="80"
     alt="Cure Logo"
     src="https://github.com/cgcoronel/cure/blob/main/logo.png">
</a>

**Cure** is a plugin manager for your Zsh terminal.

## Usage
Put in your .zshrc file the flowing code and restart your terminal

```zsh
CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh
```






