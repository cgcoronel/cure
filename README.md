# cure 

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
![version](https://img.shields.io/badge/version-v1.9.2-df5e88)

<img align="right"
     height="80"
     alt="Cure Logo"
     src="https://avatars.githubusercontent.com/u/22222101279220?s=80&v=4">
</a>

**Cure** is a plugin manager for your Zsh terminal.

## Usage
put in your .zshrc file the flowing code and restart your terminal

```zsh
CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh
```






