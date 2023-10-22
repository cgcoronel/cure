# cure 

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
![version](https://img.shields.io/badge/version-v0.1.0-df5e88)

<img align="right"
     height="80"
     alt="Cure Logo"
     src="https://github.com/cgcoronel/cure/blob/main/images/logo.png">

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

## Getting Updates
To update Cure, you should execute:

```zsh
~
% cure upgrade
```

To update all your plugins:
```zsh
~
% cure update 
```

## Uninstalling Cure
```zsh
~
% cure uninstall
```

## Some features

# Prompt

<img src="https://github.com/cgcoronel/cure/blob/main/images/prompt.jpeg">

# Autocompletion

<img src="https://github.com/cgcoronel/cure/blob/main/images/autocomplete.jpeg">

# Syntax highlighting

<img src="https://github.com/cgcoronel/cure/blob/main/images/syntax-highlighting.jpeg">





