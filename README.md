<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [Sinolor Theme](#sinolor-theme)
    - [Installation](#installation)
    - [Usage](#usage)

<!-- markdown-toc end -->

# Sinolor Theme

Sinolor themes is a theme package which code base fork from [emacs-doom-themes](https://github.com/hlissner/emacs-doom-themes "emacs-doom-themes").

Colors are selected from [CHINESE COLORS](http://zhongguose.com/ "zhongguose").

Light, Black (used in lightless night) and Vibrant theme are derived from the Dark theme.

`sinolor-green-theme` refers to [green-is-the-new-black-emacs](https://github.com/fredcamps/green-is-the-new-black-emacs "gitnb").

## Installation

1. Clone this repository

```
git clone --depth=1 https://github.com/dalugm/sinolor-themes.git
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
