# far-left
A minimal lua colorscheme for neovim. Inspired by
[left](http://100r.co/site/left.html).

## Screenshots
Supports light and dark mode!
![screenshot 1](1.png)
![screenshot 2](2.png)

## Usage
Install the theme with your favorite package manager (or lack thereof):
```lua
use 'https://git.sr.ht/~kota/far-left'
```

Run setup:
```lua
local left = require('far-left')
left.setup()
```

Using the lualine theme:
```lua
local left_theme = left.lualine()
require('lualine').setup {
	options = {
		theme = left_theme,
```

## License
GPL3 - See License for details.

Copyright 2022 Dakota Walsh
