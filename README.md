# nvim-jack-in
---
Jack in to CLJ & Leiningen from Neovim. Inpsired by [vim-jack-in](https://github.com/clojure-vim/vim-jack-in).

## Installation
### Lazy
```lua
{'TreyBastian/nvim-jack-in', config = true}
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



