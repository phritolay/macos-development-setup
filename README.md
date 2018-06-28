# MacOS Development Setup

- *all items marked with an`*` are optional*

## Open Terminal or [iTerm](https://iterm2.com) and run the following commands

*Let's get the system ready by installing Xcode Command Line Tools and Homebrew.*

```shell
xcode-select --install
```

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Once the system is ready to brew, let's install some packages

*Install Git (will use zsh git completions)*

```shell
brew install git --without-completions
```

*Install wget*

```shell
brew install wget
```

*Install ruby-build and rbenv*

```shell
brew install ruby-build rbenv
```

*Install yarn*

```shell
brew install yarn --without-node
```

**Install Heroku Command Line Interface (CLI)*

```shell
brew install heroku/brew/heroku
```

> #### Here's three Homebrew commands you need to know
>
>> Keep Homebrew packages up-to-date
>>
>> ```shell
>> brew update
>> ```
>>
>> Updated formulas after running `brew update`?
>>
>> ```shell
>> brew upgrade
>> ```
>>
>> Issues with Homebrew?
>>
>> ```shell
>> brew doctor
>> ```
>>
>> For more information on Homebrew, check out [brew.sh](https://brew.sh)

### Switch to `zsh`

*Install [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh)*

```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

*Install zsh completions*

```shell
brew install zsh-completions
```

> For more information on Oh My ZSH!, check out [ohmyz.sh](http://ohmyz.sh)

### Install plugins

*Install `nvm` via Oh My ZSH! custom plugin*

```shell
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
```

> For more information on nvm, check out [nvm](https://github.com/creationix/nvm) and [zsh-nvm](https://github.com/lukechilds/zsh-nvm)

*Install `bundler-exec` plugin*

> Automatically run Ruby scripts with "bundle exec" (but only when appropriate)

```shell
curl -L https://github.com/gma/bundler-exec/raw/master/bundler-exec.sh > ~/.bundler-exec.sh
```

> For more information on nvm, check out [nvm](https://github.com/creationix/nvm) and [zsh-nvm](https://github.com/lukechilds/zsh-nvm)

### Replace default `.zshrc` file

```shell
rm -rf ~/.zshrc; curl -L https://raw.githubusercontent.com/phritolay/macos-development-setup/master/Users/user-name/.zshrc > ~/.zshrc
```

### Generating SSH keys

*Check for existing SSH keys*

```shell
ls -al ~/.ssh
```

> Lists the files in your .ssh directory, if they exist
> Check the directory listing to see if you already have a public SSH key (e.g. id_rsa.pub)

If you don't have an existing public and private key pair, then generate a new SSH key

```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

> When you're prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location.
>At the prompt, type a secure passphrase. For more information, check out [Working with SSH key passphrases](https://help.github.com/articles/working-with-ssh-key-passphrases/).

Adding your SSH key to the ssh-agent

> 1 - Start the ssh-agent in the background
>
> ```shell
> eval "$(ssh-agent -s)"
> ```
>
> 2 - If you're using macOS Sierra 10.12.2 or later, you will need to add a `~/.ssh/config` file to automatically load keys into the ssh-agent and store passphrases in your keychain.
>
> ```shell
> curl -L https://raw.githubusercontent.com/phritolay/macos-development-setup/master/Users/user-name/.ssh/config > ~/.ssh/config
> ```
>
> 3 - Add your SSH private key to the ssh-agent and store your passphrase in the keychain.
>
> ```shell
> ssh-add -K ~/.ssh/id_rsa
> ```
>
> 4 - Add a SSH key to your GitHub account
>
>> Copy the SSH key to your clipboard.
>>
>> ```shell
>> pbcopy < ~/.ssh/id_rsa.pub
>> ```
>>
>> Go to [GitHub Settings](https://github.com/settings/keys) and click on the `New SSH key` button and paste your key into the "Key" field.

For more information, check out [Connecting to GitHub with SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)

## Setting up Atom (A hackable text editor for the 21st Century)

1. Download and install Atom

   > <a href="https://atom.io"><img src="http://seeklogo.com/images/A/atom-logo-19BD90FF87-seeklogo.com.png" width="25px"></a>

2. Open Atom and install Shell Commands

   > <img src="/images/atom-shell-commands.png" width="888px">

3. Open Atom's settings `cmd+,`

   > <img src="/images/atom-preferences.png" width="888px">

4. Go to the Install section, search for **sync-settings** and install

   > <img src="/images/atom-sync-settings.png" width="888px">

5. After **sync-settings** has been installed, click the settings

   > <img src="/images/atom-sync-settings-settings.png" width="888px">

6. Enter your Github Personal access token and the following Gist ID

   > ```settings
   > 86842ced79bac5412514590e3b2456db
   > ```
   >
   > <img src="/images/atom-sync-settings-gist-id.png" width="888px">
   >
   >> If you do not have a [Personal access token](https://github.com/settings/tokens) you can create one on GitHub.
   >>
   >> <img src="/images/github-generate-personal-access-token.png" width="888px">
   >>
   >> ---
   >>
   >> <img src="/images/github-generate-new-personal-access-token.png" width="888px">

7. In Atom open the command palette with `cmd+shift+p` and type "Sync Settings: restore"

   > <img src="/images/atom-sync-settings-restore.png" width="888px">
   >
   > ### Do not restart Atom until the download is complete

## After restating Atom, let's update some settings

1. Open Atom's settings `cmd+,`

   > <img src="/images/atom-preferences.png" width="888px">

2. Go to **Core**, scroll down to **Project Home** and change **/Users/*{user-name}*/Projects** to the location of your repos.

   > It's a good idea to keep all your projects in on place. *Not on the Desktop* ;-)
   >
   > <img src="/images/atom-preferences-core.png" width="888px">

3. Go to **Packages**, search for **linter-haml** and click on settings

   > <img src="/images/atom-preferences-linter-haml.png" width="888px">
   >
   > Change the Executable Path to your haml-lint shim path e.g. **/Users/*{user-name}*/.rbenv/shims/haml-lint**
   >
   >> Open terminal with `cmd+~` and run the following command to find your haml-lint shim
   >>
   >> ```shell
   >> which haml-lint
   >> ```
   >>
   >> <img src="/images/atom-preferences-linter-haml-path.png" width="888px">

4. Go to **Packages**, search for **linter-rubocop** and click on settings

   > <img src="/images/atom-preferences-rubocop.png" width="888px">
   >
   > Change the Command setting to your rubocop shim path e.g. **/Users/*{user-name}*/.rbenv/shims/rubocop**
   >
   >> Open terminal with `cmd+~` and run the following command to find your rubocop shim
   >>
   >> ```shell
   >> which rubocop
   >> ```
   >>
   >> <img src="/images/atom-preferences-rubocop-path.png" width="888px">

## Atom commands

| Category                     | Command                             |  Shortcut                                 |
| ---------------------------: | ----------------------------------: | :---------------------------------------- |
|                              |                                     |                                           |
| *General*                    |                                     |                                           |
|                              | *Toggle command palette*            | `cmd+shift+p`                             |
|                              | *Settings*                          | `ctrl+,`                                  |
|                              | *Toggle bottom dock*                | `ctrl+b`                                  |
| *Projects*                   |                                     |                                           |
|                              | *List projects*                     | `alt+cmd+o`                               |
| *Terminal*                   |                                     |                                           |
|                              | *Toggle terminal*                   | `cmd+~`                                   |
|                              | *New terminal window*               | `shift+cmd+t`                             |
|                              | *Next terminal window*              | `shift+cmd+k`                             |
|                              | *Previous terminal window*          | `shift+cmd+j`                             |
|                              |                                     |                                           |
| *Find*                       |                                     |                                           |
|                              | *Find in file*                      | `cmd+f`                                   |
|                              | *Find in project*                   | `cmd+shift-f`                             |
|                              | *Find next*                         | `cmd+g`                                   |
| *View / Window Manipulation* |                                     |                                           |
|                              | *Toggle tree-view sidebar*          | `cmd+backslash`                           |
|                              | *Toggle fullscreen*                 | `cmd+ctrl+f`                              |
|                              | *Move file to left pane*            | `cmd+k left`                              |
|                              | *Move file to right pane*           | `cmd+k right`                             |
|                              |                                     |                                           |
| *File Navigation*            |                                     |                                           |
|                              | *Toggle file finder*                | `cmd+p`                                   |
|                              | *Go to line*                        | `ctrl+g`                                  |
|                              | *Go to symbol*                      | `cmd+r`                                   |
|                              | *Move to beginning of file*         | `cmd+arrow up`                            |
|                              | *Move to end of file*               | `cmd+arrow down`                          |
|                              | *Next file*                         | `cmd+shift+}`                             |
|                              | *Previous file*                     | `cmd+shift+{`                             |
| *Git Integration*            |                                     |                                           |
|                              | *Git status list*                   | `cmd+shift+b`                             |
|                              | *Toggle GitHub sidebar*             | `ctrl+g`                                  |
|                              | *Git Plus menu*                     | `cmd+shift+h`                             |
|                              | *Move to next diff*                 | `alt+g+arrow down`                        |
|                              | *Move to previous diff*             | `alt+g+arrow up`                          |
|                              | *Open on GitHub: History*           | `alt+g+h`                                 |
|                              |                                     |                                           |
| *Folding*                    |                                     |                                           |
|                              | *Fold current code block*           | `cmd+alt+[`                               |
|                              | *Unfold current code block*         | `cmd+alt+]`                               |
|                              | *Unfold all code blocks*            | `cmd+alt+shift+]`                         |
| *Line Manipulation*          |                                     |                                           |
|                              | *Indent current line*               | `cmd+]`                                   |
|                              | *Outdent current line*              | `cmd+[`                                   |
|                              | *Move to the end of line*           | `cmd+arrow left`                          |
|                              | *Move to the beginning of line*     | `cmd+arrow right`                         |
|                              | *Comment line or selection*         | `cmd+forwardslash`                        |
| *Selection*                  |                                     |                                           |
|                              | *Select current word/token*         | `cmd_d`                                   |
|                              | *Select current line*               | `cmd+l`                                   |
|                              | *Select to first character of line* | `shift-alt+arrow left`                    |
|                              | *Select to last character of line*  | `shift-alt+arrow right`                   |
|                              | *Select 1 character at a time*      | `shift+arrow left` or `shift+arrow right` |
|                              | *Convert to lowercase*              | `cmd+k cmd+l`                             |
|                              |                                     |                                           |
| *Sorting*                    |                                     |                                           |
|                              | *Sort lines alphabetically*         | `alt+k`                                   |
