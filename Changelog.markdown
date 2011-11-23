v0.5.0 / 2011-11-23

Enhancements

- Create empty project directories as part of DSL
- DSL to specify project subdirectories

Changes

- Remove option to symlink to Dropbox from CLI
  - To symlink to Dropbox call `create_link_in_dropbox` in your template
- Make type an argument instead of an option
  - Type is now specified after new
  - It defaults to template if not specified
