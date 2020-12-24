<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Sinolor Theme](#sinolor-theme)
    - [Installation](#installation)
    - [Usage](#usage)

<!-- markdown-toc end -->

# Sinolor Theme

Sinolor themes is a theme package whose code base fork from [emacs-doom-themes](https://github.com/hlissner/emacs-doom-themes "emacs-doom-themes").

Colors are selected from Chinese traditional color.

Light, Black (used in lightless night) and Vibrant theme are derived from the Dark theme.

Forked from `doom-one`, `sinolor-test-theme` which is only used to test color compatible is not recommended to use.

## Installation

1. Clone this repository

```
git clone --depth=1 https://github.com/dalu98/sinolor-themes.git
```

2. Add `sinolor-themes` to load-path.

```elisp
(add-to-list 'load-path (expand-file-name "path/to/sinolor-themes"))
(require 'sinolor-themes)
```

## Usage

``` elisp
(load-theme 'sinolor-dark t)
```
