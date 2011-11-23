# A clean ~ keeps a development environment together

Projit is a utility to specify directory structures for the different types of projects you work on and consistently generate them. It very nicely supports creating directories and files, copying directories and files, symlinking to dropbox and cloning source code directly from any git repository.

## Installation

    gem install projit

If you don't use Ruby on a regular basis you may want to hold off until I get a chance to create some package manager recipes.

## Usage

    projit new personal/projit

This will run the recipe you have installed in `~/.projit/template.rb`. To get the generator that I use for web applications download [this gist][template].

    projit new personal/projit --git joefiorini/projit

This will run the same recipe but also clone the specified git repository (assuming you have `clone_from_git` in your recipe).

    projit new screencast personal/projit_demo

Runs the recipe stored in `~/.projit/screencast.rb` to setup a directory structure for screencasting. To get the generator that I use for screencasting download [this gist][screencasting] (structure stolen from @topfunky).

## Templates

Projit makes a few methods available to you to assist you in creating your directory structure. Use `project_name` to get access to the name you specified at the command line. `create_project_directory` will create the directory specified by "name" at your project root; its counterpart `create_project_subdirs` will create the directories you specified by calling `project_subdirs` under the project. Finally, `create_link_in_dropbox` will symlink your project to Dropbox (add a `dropbox_home` option to ~/.projit/config).

## Contributions

Contributions are encouraged, but given the very personal nature of workflows don't be suprised if I prefer creating recipes over adding to projit itself. Feel free to send pull requests though, it's the only way for me to see how other people use this. I will not accept Ruby code without spec coverage.

I would especially welcome package manager packages/tips. I don't want to require Rubygems for others to use this, but I have never packaged anything for distribution to brew/apt/emerge/port/etc.

Now, go get your home directory organized!

[template]: https://gist.github.com/1336554
[screencasting]: https://gist.github.com/1336563
