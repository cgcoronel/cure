# cure 

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg)](/LICENSE)
![version](https://img.shields.io/badge/version-v1.2.0-df5e88)

<img align="right"
     height="80"
     alt="Cure Logo"
     src="https://github.com/cgcoronel/cure/blob/main/images/logo.png">

**Cure** is a plugin manager for your Zsh terminal.

## Usage
Put the following code in your .zshrc file and restart your terminal.

```zsh
CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh
```

## Getting Updates
To update Cure, you should execute the following command:

```zsh
~
% cure upgrade
```

To update all your plugins, execute the following command:

```zsh
~
% cure update 
```

## Add new plugins
To add new plugins to Cure, you need to edit the .cure/.modules file and include them by specifying the repository and the startup script. Then, to load them, you need to restart your terminal.

Here are some examples:

```zsh
# Modules

zimfw/environment init.zsh
zimfw/asciiship asciiship.zsh-theme
zimfw/git-info init.zsh
zimfw/input init.zsh 
```


## Uninstalling Cure
And finally, to uninstall Cure, you should execute the following steps:

First, execute the following command:

```zsh
~
% cure uninstall
```

And then, remove the following block of code from your .zshrc.

```zsh
CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh
```



## Some features

### Prompt

<img src="https://github.com/cgcoronel/cure/blob/main/images/prompt.jpeg">

### Autocompletion

<img src="https://github.com/cgcoronel/cure/blob/main/images/autocomplete.jpeg">

### Syntax highlighting

<img src="https://github.com/cgcoronel/cure/blob/main/images/syntax-highlighting.jpeg">





