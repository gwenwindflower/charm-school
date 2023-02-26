# ✨💄 Welcome, girly! 💅🏻✨

You've found yourself at charm school, the easiest way to get your terminal and editor into shape for data work. This is an _opinionated_ set of dotfiles that is easy to install, but I will endeavor to explain these opinions and purpose via extensive commenting and documentation. I welcome issues and PRs to add docs and explanation for specific areas.

I'm writing this in February of 2023, and imagine it's going to take me at least several months to get this all doc'ed up, so if there are specific areas you'd like me to prioritize, let me know via an issue!

I see this repository as useful for 2 types of people:

1. New analytics engineers who haven't formed strong opinions on their toolset yet and want a rapid way to get a customizable, good-feeling terminal and editor experience set up.
2. Experienced practitioners who (sanely) don't enjoy gardening their dotfiles, want a general framework to start from, and are comfortable editing the defaults and ripping out what they don't like.

If you're opinionated about your terminal and editor experiences, and very comfortable with customizing them, this may provide interesting ideas for you (for instance my approach to bringing a vimmy feel to navigating VSCode) but I wouldn't recommend installing it, as at present the install is all-or-nothing.

Lastly, at present this is only tested on my personal 2020 MacBook Pro running whatever the newest MacOS is. Do not use it if you're running Windows or Linux. In June I'm getting a Mac with Apple Silicon and will make sure it works on that at that time. Until then, it's probably going to be fine but I can't say for sure. If you're running an Intel Mac with a recent version of MacOS you should be fine, but use at your own risk. There's no easy way to undo the install yet if you don't like the settings. I hope in the future to add more optional paths, CI, uninstall scripts, and customizable install options to share this with a larger audience in a more robust way.

## 📚 Table of Contents

1. How to work with this repo
2. Terminal configs
3. VSCode configs

## How to work with this repo

The install is managed via [dotbot](https://github.com/anishathalye/dotbot). This is installed in the repo as a submodule along with two plugins to manage [Homebrew](https://github.com/wren/dotbot-brew) and provide more legible [conditional installations](https://gitlab.com/gnfzdz/dotbot-conditional/).

## Do the thing

If you're inside the repo, you simply run `source install`.

### ✌🏻 A note on vim

I learned to code in vim. It's what the senior engineers at the company I first worked at did, and they made me work in it to get their help. I'm deeply grateful they did this. Vim as a philosophy is initially intimidating, but elegant and fast when you get used to it. That said, these dotfiles are oriented towards VSCode, which (sacrilegiously) I use these days and think is just fantastic. This repo does contain a patchy vim config, but I don't plan to document or refine it right now, it's just to make vim feel decent when i use it for a quick edit. It does attempt to give VSCode as vimmy a feel as possible though.

You should be excited to walk the path of vim to use these dotfiles or you will be fighting against the flow of all the configurations.
