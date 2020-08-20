<img src="./dark-screenshot.png">
<img src="./light-screenshot.png">

## Dalu's Emacs Theme

dalu-themes is my customized theme package, code base fork from [emacs-doom-themes](https://github.com/hlissner/emacs-doom-themes "emacs-doom-themes").

Remove some niche packages code and try to keep compatible in terminal and GUI.

### Installation

1. Clone this repository

```
git clone --depth=1 https://github.com/dalu98/dalu-themes.git
```

2. Add `dalu-themes` to load-path.

```elisp
(add-to-list 'load-path (expand-file-name "path/to/dalu-themes"))
(require 'dalu-themes)
```

### Usage

#### Load theme

Switch to dark theme:

```elisp
(dalu-themes-load-dark)
```

Switch to light theme:

```elisp
(dalu-themes-load-light)
```

#### Toggle theme

```elisp
(dalu-themes-toggle)
```

#### Load theme with current time

```elisp
(dalu-themes-load)
```

#### Check the time every hour then adjusted theme with sunrise

```elisp
(dalu-themes-load-with-sunrise)
```
