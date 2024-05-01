# nvim-jack-in
---
Jack in to CLJ & Leiningen from Neovim. Inpsired by [vim-jack-in](https://github.com/clojure-vim/vim-jack-in).

## Installation
### Lazy
```lua
{'TreyBastian/nvim-jack-in', config = true}
```

#### Example with options
```lua
{
  'TreyBastian/nvim-jack-in',
  opts = {
      location = 'vsplit',
      force_powershell = true,
  },
  config = true,
}
```

### Options
#### `clj_dependencies`
Dependencies that should be injected into clj
##### Default
```lua
clj_dependencies = {
  { name = "nrepl/nrepl",       version = "RELEASE" },
  { name = "cider/cider-nrepl", version = "RELEASE" },
}
```

#### `clj_middleware`
Middleware that should be injected into clj
##### Default
```lua
clj_middleware = {
  "cider.nrepl/cider-middleware"
}
```

#### `lein_plugins`
Plugins that should be injected into leiningen 
##### Default
```lua
lein_plugins = {
  { name = "cider/cider-nrepl", version = "RELEASE" },
}
```

#### `location`
Location where the repl should open 
##### Default
```lua
location = 'buffer' 
```
##### Choices
`buffer` - opens repl in a new buffer with focus
`background` - opens repl in a new buffer but you stay focused on current buffer
`split` - opens repl in new split
`vsplit` - opens repl in new vertical split
`tab` - opens repl in new tab

#### `force_powershell`
Force the useage of powershell. In windows setting `vim.o.shell = powershell` might sometimes not be optimal. Clj by default on windows is installed as a powershell module. This forces the plugin to use powershell.;
##### Default
```lua
force_powershell = false,
```

## Usage
