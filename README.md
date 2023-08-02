## <h1 align="center"><img align="center" src="https://video-public.canva.com/VAD8lnOL18Q/v/d889ead9ee.gif" alt="sparkling star" height="30" width="40" /> Beautiful Rice and More Configs <img align="center" src="https://video-public.canva.com/VAD8lnOL18Q/v/d889ead9ee.gif" alt="sparkling star" height="30" width="40" /></h1>
>  :star2: :star2: Built with and inspired by great designs :star2: :star2:

### Credit & Acknowledgement

I want to acknowledge these wonderful people for inspiring me to make this config. Some helped by
providing the bootstrap of some components, some by suggesting better scripting styles and others by
recommending fixes and the logic structure to how things work. Without them, this might not have been
possible.

|               Name                |               Support             |               Socials             |
|:----------------------------------|:----------------------------------|:----------------------------------|
| Sidhanth Rathod                   | His riced dwm bootstrap called [chadwm](https://github.com/siduck/chadwm) was my inspiration      |<a href="https://matrix.to/#/@siduck:matrix.org" target="blank"><img align="center" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh0HK0vPikdoBqarhpV5gdQq9DzUc25mUowB2EawNTrP7kWhelKhYG--ZskvzpKuWJGUg&usqp=CAU" alt="Sidhanth Rathod" height="30" width="40" /></a>  <a href="https://discord.com/users/600704648038580235" target="blank"><img align="center" src="https://www.svgrepo.com/show/353655/discord-icon.svg" alt="Sidhanth Rathod" height="30" width="40" /></a>  <a href="https://t.me/siduck" target="blank"><img align="center" src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" alt="Sidhanth Rathod" height="30" width="40" /></a> <a href="https://github.com/siduck" target="blank"><img align="center" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="siduck" height="40" width="40" /></a> |
| Gyen Abubakar Sadick              | Reviewed rices and made countless great suggestions |<a href="https://twitter.com/gyenabubakar" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="Gyen Abubakar" height="30" width="40" /></a>  <a href="https://linkedin.com/in/gyenabubakar" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="gyen abubakar" height="30" width="40" /></a>  <a href="https://github.com/gyenabubakar/gyenabubakar" target="blank"><img align="center" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="gyenabubakar" height="40" width="40" /></a>  <a href="https://hashnode.com/@gyenabubakar" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/hashnode.svg" alt="gyen abubakar" height="30" width="40" /></a>|
| Alkis Georgopoulos                | Contributed greatly to the wal script for setting random wallpapers      |<a href="https://matrix.to/#/@alkis:matrix.org" target="blank"><img align="center" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh0HK0vPikdoBqarhpV5gdQq9DzUc25mUowB2EawNTrP7kWhelKhYG--ZskvzpKuWJGUg&usqp=CAU" alt="Alkis Georgopoulos " height="30" width="40" /></a>  <a href="https://github.com/alkisg" target="blank"><img align="center" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" alt="alkisg" height="40" width="40" /></a> |
---

### Install Guide
This script is made for Linux platform-based machines that utilize the `aptitude` package manager. Maybe some
time later, I will consider releasing support for other package managers for Linux.

> To install, simply run the folowing command:

```bash
curl https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/install.sh | sh
```

> The document and config follows the structure below:
 - Git installation verification and setup
   - Git configuration on user confirmation
 - Installing NerdFonts
 - Installing and setting up the fish terminal
 - Installing and setting up the tmux terminal
 - Installing [Sidhanth Rathod](https://github.com/siduck/bubbly)'s bubbly widget on user confirmation
 - Installing and setting up neovim and neovide
 - Installing and setting up dwm

___

## :cop: Git :cop:


https://github.com/CharaD7/chara-dotfiles/assets/9804780/7b3c9776-9740-4ae5-a686-003e383d4b22


<details>
    <summary>After user permits the setup of git aliases, user will be able to execute several Git commands
    using abbreviated form or shortcuts</summary>

   > - `git init` is aliased `g i`
   > - `git fetch` is aliased `g f`
   > - `git clone` is aliased `g cl`
   > - `git fetch origin +refs/pull/*/head:refs/remotes/origin/pr/*` is aliased `g pr`
   > - `git remote add origin` is aliased `g rao`
   > - `git remote set-url origin` is aliased `g rso`
   > - `git commit -m {message}` is aliased `g acm {message}`
   > - `git commit --amend -m {message}` is aliased `g aca {message}`
   > - `git checkout` is aliased `g c`
   > - `git config --get user.name` is aliased `g cn`
   > - `git config --get user.email` is aliased `g ce`
   > - `git checkout main` is aliased `g con`
   > - `git checkout -b` is aliased `g cob`
   > - `git checkout --orphan` is aliased `g co`
   > - `git branch` is aliased `g b`
   > - `git branch -r` is aliased `g br`
   > - `git branch -m` is aliased `g brn`
   > - `git branch -a` is aliased `g ba`
   > - `git branch --merged` is aliased `g bm`
   > - `git branch --no-merged` is aliased `g bn`
   > - `git diff` is aliased `g df` *Note that this is an advance git diff that uses peco, hist and awk*
   > - `git log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --al` is aliased `g hist`
   > - `git log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative` is aliased `g llog`
   > - `git !hub browse` is aliased `g open`
   > - `git remote -v` is aliased `g r`
   > - `git remote rm origin` is aliased `g rmo`
   > - `git branch -d` is aliased `g bd`
   > - `git branch -D` is aliased `g bD`
   > - `git push` is aliased `g p`
   > - `git pull origin` is aliased `g pl`
   > - `git pull --all` is aliased `g pa`
   > - `git push origin main` is aliased `g pon`
   > - `git pull origin main` is aliased `g plon`
   > - `git push origin` is aliased `g po`
   > - `git status` is aliased `g s`
   > - `git push -f origin HEAD^:main` is aliased `g undopush`
   > - `git merge main` is aliased `g mn`
   > - `git merge` is aliased `g m`
   > - `git reset --hard HEAD@{1}` is aliased `g undomerge`
   > - `git reset --hard` is aliased `g undo`
   > - `git reset HEAD {file}` is aliased `g unstage {file}`
</details>

___

## :honey_pot: NerdFonts - [Nice ligature fonts] :honey_pot:

[NerdFonts](https://www.nerdfonts.com) is a home of great and beautiful wide range of fonts.

<details>
    <summary>To give you the best of ligature feel and look, the following fonts have been used in this setup:</summary>

   > - Caskaydia Cove NerdFont
   > - Fira Code NerdFont
   > - FiraCode iScript
   > - Hurmit NerdFont *Bonus Font that has not been used in this setup*
   > - Iosevka NerdFont
   > - Jetbrains Mono NerdFont
   > - MaterialDesignIconsDesktop Font
   > - Roboto Mono NerdFont

   These fonts can be located in the [NerdFonts directory](https://github.com/CharaD7/chara-dotfiles/tree/main/NerdFonts)
</details>

___

## :fish: Fish :fish:

https://github.com/CharaD7/chara-dotfiles/assets/9804780/324b41a7-729a-4184-8802-bbdafc792238

[Fish](https://fishshell.com) shell is one of the best shells to use as a developer if [VIM](https://vim.org) is your preferred IDE. It
has been made such that there is a mode you can switch to in order to emulate [VIM](https://vim.org) commands,
making you the developer super-productive. To learn more about scripting with fish, kindly visit the [docs](https://fishshell.com/docs/current/index.html).

After system reboots, you will need to run the following commands to install the packages listed below for the fish terminal.

```fish
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
    omf install z peco
    omf theme bobthefish
    fisher install jorgebucaran/fisher
    fisher install x-motemen/ghq
```

<details>
    <summary>The fish config script installs a couple of packages to make your experience with fish seemless:</summary>

   > - [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) *My fish is not lost* :smirk:
   > - [fisher](https://github.com/jorgebucaran/fisher/tree/main) - A package manager for fish
   > - [z](https://github.com/jethrokuan/z) - A directory jumper that can be installed using [fisher](https://github.com/jorgebucaran/fisher/tree/main)
   > - [powerline-config](https://powerline.readthedocs.io/en/master/installation.html#patched-fonts) - A python-based font patcher for terminals
   > - [bobthefish](https://github.com/oh-my-fish/theme-bobthefish) - A theme for the fish terminal
   > - [ghq](https://github.com/x-motemen/ghq) - A repository organizer, very handy when you work with a lot of them and can't structure it easily.
   > - [exa](https://the.exa.website/) - A mordern replacement for `ls` with rich features
   > - [peco](https://github.com/peco/peco) - A fuzzy finder plugin for fish terminal

   **NB:** Go to the [fish config's aliases](https://github.com/CharaD7/chara-dotfiles/blob/main/fish/config.fish) to see which aliases are registered for the fish shell.
   *To emulate vim movement and Visual key bindings, hit the `<Escape>` key. Hit `i` to get back into edit mode*
</details>

___

## :pager: TMUX :pager:

![fish-tmux](https://github.com/CharaD7/chara-dotfiles/assets/9804780/b28af3a8-bc9e-40ef-9a47-a8e87f326fdf)
*Tmux preview*

[tmux](https://github.com/tmux/tmux/wiki) is a terminal multiplexer, allowing you to switch between several programs, detach and reattach them in
different programs, it proves to be one of the best terminals out there. to know more about it and how to easily navigate your way while using it,
see the [docs](https://github.com/tmux/tmux/wiki/Getting-Started). This repo's `tmuxConfig` script comes with powerline fonts and a script
to run and configure tmux to have the status bar as you see it in the above picture. To know more about the key combinations, I recommend using the
section on [key moodifiers](https://github.com/tmux/tmux/wiki/Modifier-Keys). However, the [setup](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/.tmux.conf)
comes with predefined key bindings you may want to take a look at the [tmux conf](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/.tmux.conf)
file.

___

## :full_moon: Neovide - [No nonsense IDE] :full_moon:

 ![neovide](https://github.com/CharaD7/chara-dotfiles/assets/9804780/a3ce5a06-e8f0-4b17-9596-f9d40dc8cc52)
 *Neovide preview*

https://github.com/CharaD7/chara-dotfiles/assets/9804780/7bef1b54-c233-46cb-85e9-5d1f628468f1


[Neovide](https://neovide.dev) is a no-nonsense, cross-platform graphical user interface for [Neovim](https://github.com/neovim/neovim) (an awesome IDE that
is open source and seeks to aggresively refactor [VIM](https://www.vim.org/)). Supporting a lot of very cool [features](https://neovide.dev/features.html),
it promises a wonderful future of an extensible, yet, very stable IDE for vimmers like myself. The [Neovide](https://neovide.dev) graphical user interface though
intuitive, does not work on its own, it needs a [Neovim](https://github.com/neovim/neovim) ```init.lua``` or ```init.vim``` file to work and so you may want to
consider having that before using this beauty 😎 That said, this [nvimConfig](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/configNvim) comes with
some features of [Neovide](https://neovide.dev) configured to make your experience using the IDE awesome ✨

<details>
    <summary>Below is a list of the features enabled and how they are used:</summary>

   > - Ligature Support *(enabled by default)*
   > - Animated Cursor - ```vim.g.neovide_cursor_animation_length = 0.13``` *(set to 0.13seconds)*
   > - Animated Cursor Particles - ```vim.g.neovide_curosr_vfx_mode =  "railgun"``` *(Leave animated particles anytime cursor jumps around)*
   > - Smooth Scrolling - *(enabled by default)*
   > - Animated Windows - *(enabled by default)*
   > - Transparency - ```vim.g.neovide_transparency = 0.8``` *(you can increase the opacity as you like it)
   > - Blurred Floating Windows - ```vim.g.neovide_floating_blur_amount_x = 4.0``` and ```vim.g.neovide_floating_blur_amount_y = 4.0```
   > - Emoji Support - *(enabled by default)*
   > - IDE Paddings - ```vim.g.neovide_padding_[direction] = 10``` *(substitute **[direction]** for **top**, **bottom**, **left** and **right**)*

   You can take a peek at the features enabled using the [permalink](https://github.com/CharaD7/chara-dotfiles/blob/2119a40ee647ae530261c916cd184424a5b7d44c/nvim/lua/chara/options.lua#L88)

   **NB:** I have enabled autosave on every edit and on focus lost by default in this config. If it is bothersome to you, come to [this block](https://github.com/CharaD7/chara-dotfiles/blob/2119a40ee647ae530261c916cd184424a5b7d44c/nvim/after/plugin/autocommands.lua#L58)
   and comment it out.
</details>

___

## :gem: DWM - [Tiling Window Manager] :gem:

[DWM](https://dwm.suckless.org/) (Dynamic Window Manager) is a window manager for X. It displays windows in several layouts such as
tiled, monocle and floating. It is more convenient to use though requires some work if you need it to look beautiful and want to
use your custom keybindings to invoke certain calls or programs. There are several [patches](https://dwm.suckless.org/patches/) available
on the [suckless](https://dwm.suckless.org) site that can be added to the config to suit user's taste.

[Configuration](https://github.com/CharaD7/chara-dotfiles/tree/main/dwm) files for dwm can be found in your `~/.config/dwm/` directory. In there
you should see a *scripts* folder which contains *bar*, *bubbly*, *fetch*, *run.sh* and *wal* scripts. In addition to these, there is the *bar_themes* directory.

- The [wall](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/dwm/scripts/wal) script changes the desktop wallpaper after every 20 minutes. You can change the duration [here](https://github.com/CharaD7/chara-dotfiles/blob/d93f53b8b476f13bf767f30c18c055223ce73010/dwm/scripts/wal#L12)
- The [bubbly](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/dwm/scripts/bubbly) script houses methods for calling the chat and keystroke widgets
- The [bar](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/dwm/scripts/bar) script contains methods for the tasks on the status bar. You can add to it if you wish.
- The [run.sh](https://github.com/CharaD7/chara-dotfiles/blob/main/dwm/scripts/run.sh) script is what gets executed anytime dwm starts

There is provision for extended display in the [run.sh](https://github.com/CharaD7/chara-dotfiles/blob/main/dwm/scripts/run.sh) script and in the [config.def.h](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/dwm/dwm/config.def.h). [Configuration](https://github.com/CharaD7/chara-dotfiles/tree/main/dwm/) files for dwm can be found in your `~/.config/dwm/` directory.
You may want to take a look at it to know where to set your display in case you have an extended display on. By default, the *run.sh* script launches dwm with the screen extended to the monitor on the right.

### DWM key combinations

<details>
    <summary>Let us look at how we can move around and call up applications we need in this dwm config.</summary>

   There are certain things you need to be aware of in the [config.def.h](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/dwm/dwm/config.def.h) folder which you can locate at `~/.config/dwm/dwm/config.def.h`
   > - You can set border of your windows to `0` on [this line](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L6) so they are not visible.
   > - You can set a different theme for your topbar on [this line](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L65).
   > - If you have more launchers you want to add to the topbar, you can add them on [this line](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L97).
   > - Layouts for your window manager can be found [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L139)
   > - **MODKEY** is basically your *logo* or *windows* key.
   > - **ControlMask** is your *Ctrl* key.
   > - **ShiftMask** is your *Shift* key.
   > - **Mod1Mask** is your *Alt* key.

   **NB:** You can set extra keys like the Right Ctrl and Right Shift Keys to be distinct from their left counterparts.

   **Keyboard keys**
   > - **Logo+c** invokes `rofi -show drun`. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L190)
   > - The audio and brightness keys are set [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L178). You can change them as you wish.
   > - **Logo+r** invokes `rofi -show run`. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L191)
   > - **Logo+Return** or **Logo+Enter** invokes the suckless terminal. In this case, I prefer to use tmux so I set it to `st tmux`. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L192).
   > - **Logo+Shift+Space** toggles a window to float in the screen. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L197)
   > - **Logo+b** toggles on and off the topbar visibility. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L195)
   > - **Logo+f** toggles window fullscreen mode. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L198)
   > - **Logo+Left** and **Logo+Right** switches views to the left and right workspace respectively. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L207)
   > - **Logo+Shift+j** and **Logo+Shift+k** moves window stacks left and right respectively. You can change that [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L217)
   > - **Logo+Ctrl+i** and **Logo+Ctrl+d** increases and decreases the overall gaps between the windows respectively. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L223)
   > - **Logo+Shift+i** and **Logo+Ctrl+Shift+i** increases and decreases the inner gaps between windows respectively. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L227)
   > - **Logo+Ctrl+o** and **Logo+Ctrl+Shift+o** increases and decreases the outer gaps between windows. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L231)
   > - **Logo+Shift+,** moves current window to the next display on the left. You can change that [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L259)
   > - **Logo+Shift+.** moves current window to the next display on the right. You can change that [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L260)
   > - **Logo+Ctrl+q** kills dwm completely. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L268)
   > - **Logo+q** kills the current window client. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L271)
   > - **Logo+e** hides current window. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L277)
   > - **Logo+Shift+e* unhides hidden window. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L278)
   > - **Logo+number** *(in this case, 1 to 9)* switches the view to that workspace number. You can change that [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L280)
   > - **Logo+Ctrl+p** changes current wallpaper. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L285)
   > - **Logo+Ctrl+l** puts the machine in suspended state. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L287)
   > - **Logo+Ctrl+r** reboots the machine. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L289)
   > - **Logo+Ctrl+s** shuts down the machine. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L291)
   > - **Logo+Alt+Left** spans left monitor display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L295)
   > - **Logo+Alt+Right** spans right monitor display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L298)
   > - **Logo+comma** focuses left monitor display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/f954fa211bceaa5e6afd44602b7dde56be513909/dwm/dwm/config.def.h#L257)
   > - **Logo+period** focuses right monitor display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/f954fa211bceaa5e6afd44602b7dde56be513909/dwm/dwm/config.def.h#L258)
   > - **Logo+Shift+comma** moves current focus window to left display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/f954fa211bceaa5e6afd44602b7dde56be513909/dwm/dwm/config.def.h#L259)
   > - **Logo+Shift+period** moves current focus window to right display. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/f954fa211bceaa5e6afd44602b7dde56be513909/dwm/dwm/config.def.h#L260)
   > - **Logo+Ctrl+c** invokes the chat bubble widget. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L303)
   > - **Logo+Ctrl+k** invokes the keystroke bubble widget. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L305)
   > - **Logo+Ctrl+Shift+c** kills the chat bubble widget. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L307)
   > - **Logo+Ctrl+Shift+k** kills the keystroke bubble widget. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L310)

   **Mouse keys**
   > - **Logo+Leftclick** moves a floating window. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L339)
   > - **Logo+Rightclick** resizes a floating window. You can change it [here](https://github.com/CharaD7/chara-dotfiles/blob/0bd6ca0d228ec098cd373df2ed3ebbf5a87d5f0d/dwm/dwm/config.def.h#L341)

   **NB:** 
   1. You need to hold the mouse buttons down together with the Logo button while performing mouse actions.
   2. If you make a change to the `config.def.h` file, you will need to recompile it by running `sudo make clean install` and run **Logo+Shift+r** to reload your dwm.

</details>


<details>
    <summary>Included in this config are the following plugins:</summary>

   > - [picom](https://gist.github.com/AvishekPD/f70dea1449cfae856d42b771912985f9) - for managing rounded corners and opacity of windows
   > - [rofi](https://manpages.ubuntu.com/manpages/bionic/en/man1/rofi.1.html) - a window switcher, application launcher and replacement for dmenu
   > - [eww](https://elkowar.github.io/eww/) - Elkowar's Wacky Widgets for dwm
   > - bubbly - *(concept made from siduck's bubbly widget)*
   > - dashboard - *(concept made from siduck's chadwm riced dwm)*

   **NB:** You may have to reconfigure your bubbly and dashboard to work perfectly based on your display. I had to reconfigure bubbly and dashboard
   before I got them to work as my inspiration's but thankfully enough, I have highlighted where the changes can be made and how to change the values
   as you would like.

   *(I really thank [Sidhanth Rathod](https://github.com/siduck) for inspiring me to make with this compilation. You are such a beautiful gem.)*

   ### Picom

 ![picom](https://github.com/CharaD7/chara-dotfiles/assets/9804780/d54ea1a2-af9b-4dee-a915-32ebe73bf29b)
 *Picom windows preview*

   The [picom](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/picom/picom.conf) plugin will automatically be saved to your `~/.config/picom` directory, as such, any
   changes you wish to make to the window transparency, blur or corners should be done in the `~/.config/picom/picom.conf` file. You can also make changes to the animation of windows
   in the same file. Here is a highlight of what you can change in picom

   > - The [animation](https://github.com/CharaD7/chara-dotfiles/blob/41ff240d832bbd6cc25b64e57c9406be17729fc6/picom/picom.conf#L1)
   > - The [corners](https://github.com/CharaD7/chara-dotfiles/blob/41ff240d832bbd6cc25b64e57c9406be17729fc6/picom/picom.conf#L14)
   > - The [shadows](https://github.com/CharaD7/chara-dotfiles/blob/41ff240d832bbd6cc25b64e57c9406be17729fc6/picom/picom.conf#L37)
   > - The [fades](https://github.com/CharaD7/chara-dotfiles/blob/41ff240d832bbd6cc25b64e57c9406be17729fc6/picom/picom.conf#L112)
   > - The [transparency/opacity](https://github.com/CharaD7/chara-dotfiles/blob/41ff240d832bbd6cc25b64e57c9406be17729fc6/picom/picom.conf#L144)
   > - The [blur](https://github.com/CharaD7/chara-dotfiles/blob/aae40ed4f6cac8922601d6c28c0f4ca1d1b638de/picom/picom.conf#L222)
   > - General [render](https://github.com/CharaD7/chara-dotfiles/blob/aae40ed4f6cac8922601d6c28c0f4ca1d1b638de/picom/picom.conf#L285)

   ### Rofi

 ![rofi-run](https://github.com/CharaD7/chara-dotfiles/assets/9804780/782ecf9f-a4e4-4ec8-bf52-1d5d2cfd53e9)
 *rofi -show run*

 ![rofi-drun](https://github.com/CharaD7/chara-dotfiles/assets/9804780/0b0ad848-0e0b-413f-85a0-0e5363283d57)
 *rofi -show drun*

   [Rofi](https://manpages.ubuntu.com/manpages/bionic/en/man1/rofi.1.html) is a window switcher application that works on basically any X11 display manager. It is included in this config
   to allow users launch applications and run scripts from a mini-window. There is a `config.rasi` for every rofi application that specifies the looks and behaviour of rofi modes. After
   running the `install.sh`, you will locate the config file in `~/.config/rofi/config.rasi`. In addition to this, you will find a directory in the *rofi* directory called *themes* which
   has a couple of themes from which you can choose to set for your rofi application. Here are the options available to use and modify in this rofi config.

   #### Themes

   > - [Dracula](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/dracula.rasi)
   > - [Everblush](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/everblush.rasi)
   > - [Forest](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/forest.rasi)
   > - [Gruv](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/gruv.rasi)
   > - [Nord](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/nord.rasi)
   > - [Onedark](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/rofi/themes/onedark.rasi)

   #### Rofi config

   Go to the [rofi config](https://github.com/CharaD7/chara-dotfiles/blob/main/rofi/config.rasi) to have a quick look at how things are structured in there to be well-informed of your decision
   to make changes to the rofi application. Feel free to skip taking a peek if you are already familiar with configuring rofi.

   > - [Basic configuration](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L1)
   > - [Theme selection](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L15)
   > - [Element styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L17)
   > - [Window styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L22)
   > - [Mainbox styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L30)
   > - [Inputbar styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L34)
   > - [Prompt styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L41)
   > - [Entry styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L54)
   > - [Items view styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L61)
   > - [Icon styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L75)
   > - [Button styling](https://github.com/CharaD7/chara-dotfiles/blob/9572bbddb9d2e076eb336c8b2b4ca63028201f7c/rofi/config.rasi#L88)


   ### EWW

   [EWW](https://elkowar.github.io/eww/) *(Elkowar's Wacky Widgets for dwm)* is a stress-free way to create your own widgets in dwm. It uses `eww.yuck` as its configuration file and `eww.scss` as its
   stylesheet configuration. Two plugins were used in this config (bubbly, and dashboard).

   #### Bubbly config

https://github.com/CharaD7/chara-dotfiles/assets/9804780/8d3e2b41-9664-49fc-a8c7-6ab00d962711


https://github.com/CharaD7/chara-dotfiles/assets/9804780/8ad60084-d06d-4723-a9ee-1fcbc808ae19


   Bubbly is a chat-like widget that displays keystrokes as chat bubbles. There are two modes, the *chat* mode, and the *keystroke* mode. The above videos demonstrate the use of each mode. The script
   saves [bubbly desktop](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/bubbles/bubbly.desktop) to your `/usr/share/applications/` directory.

   The [keystrokes](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/bubbles/config/keystrokes) file is where keystroke limit and theme is set. It is stored in your `~/.config/bubbly/` directory.
   The [keycodes](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/bubbles/local/keycodes) is where your keycodes are set. The keycodes in here may be different from yours aside the basic alphabet
   and number keys. To know and set the keycodes for your audio control keys, run `xmodmap -pK | grep -i audio`. This will show you what keycodes are used for your audio keys so you can map them in the
   [keycodes](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/bubbles/local/keycodes) file. This file will be located in your `~/.local/share/bubbly/` directory.

   For example, if I want to know the keycode to my audio mute key, this is what it is going to look like.

   - I first run the command

   ```bash
        xmodmap -pk | grep -i audio
   ```

   - I get this output
   ```bash
    121         0x1008ff12 (XF86AudioMute)      0x0000 (NoSymbol)       0x1008ff12 (XF86AudioMute)
    122         0x1008ff11 (XF86AudioLowerVolume)       0x0000 (NoSymbol)       0x1008ff11 (XF86AudioLowerVolume)
    123         0x1008ff13 (XF86AudioRaiseVolume)       0x0000 (NoSymbol)       0x1008ff13 (XF86AudioRaiseVolume)
    171         0x1008ff17 (XF86AudioNext)      0x0000 (NoSymbol)       0x1008ff17 (XF86AudioNext)
    172         0x1008ff14 (XF86AudioPlay)      0x1008ff31 (XF86AudioPause)     0x1008ff14 (XF86AudioPlay)      0x1008ff31 (XF86AudioPause)
    173         0x1008ff16 (XF86AudioPrev)      0x0000 (NoSymbol)       0x1008ff16 (XF86AudioPrev)
    174         0x1008ff15 (XF86AudioStop)      0x1008ff2c (XF86Eject)  0x1008ff15 (XF86AudioStop)      0x1008ff2c (XF86Eject)
    175         0x1008ff1c (XF86AudioRecord)    0x0000 (NoSymbol)       0x1008ff1c (XF86AudioRecord)
    176         0x1008ff3e (XF86AudioRewind)    0x0000 (NoSymbol)       0x1008ff3e (XF86AudioRewind)
    198         0x1008ffb2 (XF86AudioMicMute)   0x0000 (NoSymbol)       0x1008ffb2 (XF86AudioMicMute)
    208         0x1008ff14 (XF86AudioPlay)      0x0000 (NoSymbol)       0x1008ff14 (XF86AudioPlay)
    209         0x1008ff31 (XF86AudioPause)     0x0000 (NoSymbol)       0x1008ff31 (XF86AudioPause)
    215         0x1008ff14 (XF86AudioPlay)      0x0000 (NoSymbol)       0x1008ff14 (XF86AudioPlay)
    216         0x1008ff97 (XF86AudioForward)   0x0000 (NoSymbol)       0x1008ff97 (XF86AudioForward)
    221         0x1008ffb6 (XF86AudioPreset)    0x0000 (NoSymbol)       0x1008ffb6 (XF86AudioPreset)
    234         0x1008ff32 (XF86AudioMedia)     0x0000 (NoSymbol)       0x1008ff32 (XF86AudioMedia)
   ```

   As you can see, the **AudioMute** button's keycode is the very first on the list, now, we need to make sure it is the same keycode for the readable part like `XF86AudioMute` in the keycodes file.
   On [this line](https://github.com/CharaD7/chara-dotfiles/blob/213d90fb716366c1b67357773c42eb531b615b4c/bubbles/local/keycodes#L114), you can see that the keycode matches with what was printed in my terminal. If you
   what you see in your terminal does not match what is in the keycode file, please modify it to match that of the terminal. You can grep match any other key to get its exact keycodes to use.

   #### Dashboard config

https://github.com/CharaD7/chara-dotfiles/assets/9804780/3980af9c-59f2-4dae-a7d8-ec677e0dd2c1


   The [dashboard](https://github.com/CharaD7/chara-dotfiles/tree/main/eww) widget serves as a control panel for dwm. You can control your audio and brightness levels, know a summary of your hard disk size, your OS,
   the window manager and the current date and time. It is called in the `config.def.h` file which can be located in your `~/.config/dwm/dwm/config.def.h` directory. It is hooked to the launcher defined on  [line 97](https://github.com/CharaD7/chara-dotfiles/blob/b6623c4618239cbc4f6a207c76208876ad1d6be0/dwm/dwm/config.def.h#L97).
   Configuration files for the dashboard can be found [here](https://github.com/CharaD7/chara-dotfiles/tree/main/eww). The [var.yuck](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/eww/var.yuck) file defines the various objects
   in the eww widget and how long it takes for their values to be updated when triggered. Below are styles and script hotlinks for the dashboard:

   **The Styles**
   > - The [audio slider](https://github.com/CharaD7/chara-dotfiles/tree/main/eww/scss/focal) styles
   > - The [footer styles](https://github.com/CharaD7/chara-dotfiles/tree/main/eww/scss/footer) for brightness and buttons in the footer
   > - The [header styles](https://github.com/CharaD7/chara-dotfiles/tree/main/eww/scss/header) for the status buttons and system info
   > - The [themes styles](https://github.com/CharaD7/chara-dotfiles/tree/main/eww/scss/themes) for setting the theme of the dashboard

   The theme for the dashboard is set in the [eww.scss](https://github.com/CharaD7/chara-dotfiles/blob/b6623c4618239cbc4f6a207c76208876ad1d6be0/eww/eww.scss#L1) file

   **The Scripts**
   > - The [system script](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/eww/scripts/system) contains scripts for executing package update, battery, cpu, ram, backlight, wifi, power and disk.
   > - The [fetch sccript](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/eww/scripts/fetch) contains methods for displaying OS, window manager and shell information.
   > - The [audio script](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/eww/scripts/audio) contains methods for executing audio level control

   By default, you should have **amixer** installed so it is not included in the install script. If you use a different audio mixer, you may want to consider editing the [audio script](https://raw.githubusercontent.com/CharaD7/chara-dotfiles/main/eww/scripts/audio) and setting your mixer in place of `amixer`

</details>

___
Hello, I am Chara. If you find this helpful, please do share. If you need to get in touch with me by all means, you can connect with me on [telegram](https://t.me/CharaD7), [twitter](https://twitter.com/joy_ayitey), [LinkedIn](http://linkedin.com/in/joy-ayitey-73127699) and on [discord](https://discordapp.com/users/CharaD7#0898)
___
