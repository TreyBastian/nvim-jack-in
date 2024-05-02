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

Location where the REPL should open

##### Default

```lua
location = 'buffer'
```

##### Choices

`buffer` - opens REPL in a new buffer with focus
`background` - opens REPL in a new buffer but you stay focused on current buffer
`split` - opens REPL in new split
`vsplit` - opens REPL in new vertical split
`tab` - opens REPL in new tab

#### `force_powershell`

Force the usage of powershell. In windows setting `vim.o.shell = powershell` might sometimes not be optimal. Clj by default on windows is installed as a powershell module. This forces the plugin to use powershell.

##### Default

```lua
force_powershell = false
```

## Usage

This plugin automatically registers 2 commands `:Clj`and `:Lein` to start their respective REPLs

You can easily map these commands to a key.

```lua
vim.keymap.set("n", "<leader>rc", "<CMD>:Clj<CR>")
vim.keymap.net("n", "<leader>rl", "<CMD>:Lein<CR>")
```

You can supply additional arguments to the command. For example to use [Kit-Clj](https://kit-clj.github.io) development mode you can do.
`:Clj -A:dev`

## Contributing

This project is open source, not just public source. If you wish to contribute start with an issue.

## Socials

I developed this project live on [Twitch](https://twitch.tv/Trey_Bastian). I'd appreciate any follows. You can also find me on [X - formerly Twitter](https://x.com/TreyBastian)
