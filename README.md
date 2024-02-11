# ✨💄 Welcome, girly! 💅🏻✨

![Charm School](https://github.com/gwenwindflower/charm-school/assets/91998347/e1ba0c00-5a9d-4913-bed5-210a09d6b9bc)

> Charm School is in early development, I still need to find time to write the detailed documentation for all the sections below. If you're interested in this project, please star it and check back later. I'm hoping to have full documentation of this project by the end of 2024.

You've found yourself at Charm School, an elegant dotfile repo to get your terminal and editor into form for data work. This is an _opinionated_ set of dotfiles that is easy to install, but I will endeavor to explain these opinions and purpose via extensive commenting and documentation. I welcome issues and PRs to add docs and explanation for specific areas.

I see this repository as useful mainly for folks who (sanely) don't enjoy gardening their dotfiles, want a general framework to start from, and are comfortable editing the defaults and ripping out what they don't like. Particularly, if you do data work, are comfortable with the command line, and want to use vim, this could be a good starting point for you.

This is only tested on my personal 2020 MacBook Pro and my work 2022 M2 Macbook Pro, running recent versions of MacOS. Don't install these dotfiles on anything but recent versions of MacOS. There's no easy way to undo the install yet if you don't like the settings. I hope in the future to add more optional paths, CI, uninstall scripts, and customizable install options to share this with a larger audience in a more robust way, but until that day, send your computer to Charm School at your own risk.

## 📚 Table of Contents

1. [How to work with this repo](#how-to-work-with-this-repo)
2. [Terminal configs](#terminal)
3. [Neovim configs](#neovim)

## How to work with this repo

The install is managed via [dotbot](https://github.com/anishathalye/dotbot). This is installed in the repo as a submodule along with two dotbot plugins to manage [Homebrew](https://github.com/wren/dotbot-brew) and provide more legible [conditional installations](https://gitlab.com/gnfzdz/dotbot-conditional/).

### Do the thing

If you're inside the repo, you simply run `source install` and dotbot will do its thing.

### ✌🏻 A note on vim

I learned to code in vim. It's what the senior engineers at the company I first worked at did, and they made me work in it to get their help. I'm deeply grateful they did this (thanks [@ebenoist](https://github.com/ebenoist) 💗). Vim as a philosophy is initially intimidating, but elegant and fast when you get used to it. That said, I'm not a vim evangelist. I use it because I enjoy it, and you _definitely_ don't have to use vim to be a 'real coder' (🤢 at this concept). Many, many engineers and data scientists much better than me use VSCode or other editors, and those tools are amazing too.

That said, you should be excited to walk the path of vim to use these dotfiles or you will be fighting against the flow of all the configurations.

### Other recommend tools not configured here

I use VSCode sometimes and I like it a lot, but it feels like Microsoft really wants you to use their cloud settings sync, and it's easier to just go with that flow for me, so I don't manage those settings in this repo anymore.

I also heavily, heavily recommend [Raycast](https://www.raycast.com/) but they also maintain a great cloud settings sync system, and many of its plugins have access to sensitive data and workflows, so it's easier to keep it out of this repo. You should really use it though!

## Terminal

I love the terminal a weird amount. It really does something for my neurodivergent brain. It feels fast, clean, colorful, creative, powerful, expressive, and uniform all at the same time, in a very special way that really gets my serotonin flowing. I use [kitty](https://sw.kovidgoyal.net/kitty/) as my terminal emulator, [oh-my-zsh](https://ohmyz.sh/) as my zsh framework, [Starship](https://starship.rs/) as my prompt, and [Homebrew](https://docs.brew.sh/Installation) as my package manager.

One of the reasons I like a terminal-focused approach is an ability to stay "Hands on Keyboard" (HOK) as much as possible, which is categorically faster. I also find that the more I can do in the terminal, the more I can automate, script, and keymap, which gets me into flow state faster and keeps me there longer. This is not only good for productivity, but more importantly mental health and feeling fulfilled by that productivity. Lastly, the terminal, and tools based in the terminal like vim, tend to be highly customizable, so I can form my work environment around my ever-changing needs and tastes rather than molding myself to the work.

### Kitty

Look, it's called 'kitty' and it has a cute cat icon. That should be enough. On top of that though, it actually happens to be one of the fatest terminal emulators available, has outstanding font support including ligatures, is highly extensible and customizable, image support, and tons of other cool features. [The creator and maintainer](https://github.com/kovidgoyal) is also extremely passionate and responsive, you can tell he really loves this project. This is always a really good sign for the long term health of an open source project.

My kitty configuration is found in the `kitty` directory of this repo. It's one file called `kitty.conf`. I don't have a ton of customizations, my main ones of note are designating the [Ellograph CF](https://connary.com/ellograph.html) font from the excellent independent fontsmith Connary Fagen (you need to purchase this font if you want to use it, it's not included in this repo, support independent font makers!), which I've patched with [Nerd Fonts](https://www.nerdfonts.com/) (I'll add more on how to do this soon) and setting the color scheme to [Catppucin Frappe](https://github.com/catppuccin/catppuccin) (this is my vim colorscheme as well and set everywhere possible). I also have a few aesthetic settings to get rid of the MacOS menu bar and make the tab bar look a little more stylish. Lastly, I have a few keybindings to make it easier to switch tabs, windows, and panes and resize panes in a coherent way. My kitty.conf includes all of the default boilerplate which shows you all available settings and values commented out, so if you look at that file you can see all the settings that _aren't_ commented, that's what I've changed and set.

### Oh My Zsh

Coming soon.

### Starship prompt

Coming soon.

### Homebrew

Coming soon.

### zshrc

Coming soon.

## Neovim

Coming soon.

### LazyVim

Coming soon.
