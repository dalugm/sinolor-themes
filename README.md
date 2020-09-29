<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Dalu's Emacs Theme](#dalus-emacs-theme)
    - [Installation](#installation)
    - [Usage](#usage)

<!-- markdown-toc end -->

# Dalu's Emacs Theme

dalu-themes is my customized theme package, code base fork from [emacs-doom-themes](https://github.com/hlissner/emacs-doom-themes "emacs-doom-themes").

Colors are mostly selected from traditional Chinese color.

Light ,Black (used in lightless night) and Vibrant theme are derived from dark theme.

Forked from `doom-one`, `dalu-test-theme` which is only used to test color compatible is not recommended to use.

**All themes are compatible both in terminal and GUI.**

## Installation

1. Clone this repository

```
git clone --depth=1 https://github.com/dalu98/dalu-themes.git
```

2. Add `dalu-themes` to load-path.

```elisp
(add-to-list 'load-path (expand-file-name "path/to/dalu-themes"))
(require 'dalu-themes)
```

## Usage

``` elisp
(load-theme 'dalu-dark t)
```
