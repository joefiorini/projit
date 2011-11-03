# Projit
## A clean ~ keeps a development environment together

Projit is a utility to specify directory structures for the different types of projects you work on and consistently generate them. It very nicely supports creating directories and files, copying directories and files, symlinking to dropbox and cloning source code directly from any git repository.

## Usage

  projit new personal/projit

This will run the recipe you have installed in `~/.projit/template.rb`. To get the generator that I use for web applications download [this gist][template].

  projit new personal/projit --git joefiorini/projit

This will run the same recipe but also clone the specified git repository (assuming you have `clone_from_git` in your recipe).

  projit new personal/projit\_demo --type screencast

Runs the recipe stored in ~/.projit/screencast.rb to setup a directory structure for screencasting. To get the generator that I use for screencasting download [this gist][screencasting] (structure stolen from @topfunky).

## Contributions

Contributions are encouraged, but given the very personal nature of workflows don't be suprised if I prefer creating recipes over adding to projit itself. Feel free to send pull requests though. I will not accept pull requests without a spec.

Now, go get your home directory organized!

[template]: https://gist.github.com/1336554
[screencast]: https://gist.github.com/1336563
