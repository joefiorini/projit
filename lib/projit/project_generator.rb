require 'thor/group'
require 'pathname'
require 'projit'

module Projit

  class ProjectGenerator < Thor::Group
    include Thor::Actions

    source_root "~/.projit"

    argument :type, default: "template"
    argument :project, required: false
    class_options git: nil

    def new
      apply projit_template
    end

    protected

    def projit_template
      "#{template_name}.rb"
    end

    def create_project_directory
      in_project_root do
        empty_directory project_name
      end
    end

    def project_subdirs(subdirs)
      @project_subdirs = subdirs
    end

    def create_project_subdirs
      in_project_directory do
        @project_subdirs.each { |d| empty_directory d }
      end
    end

    def in_project_root(&block)
      inside projects_home.to_s, &block
    end

    def in_project_directory(&block)
      inside projects_home_path.join(project_name), &block
    end

    def create_link_in_dropbox(name)
      unless dropbox_configured?
        say "How can I create a link to your Dropbox if you haven't told me where in your Dropbox to create it? Please add a value for 'dropbox_home' to ~/.projit/config."
        return
      end
      create_link dropbox_path_to(name), project_full_path
    end

    def clone_from_git_into(name)
      return unless options[:git]

      git = 'git clone'

      if !hub_installed? && git_path =~ /github/
        say "Did you know you that the `hub` command gives you secret GitHub powers? Install it with Homebrew using 'brew install hub'. Not using Homebrew? Ditch MacPorts and Fink and get it now! https://github.com/mxcl/homebrew"
      elsif hub_installed?
        git = 'hub clone -p'
      end

      say_status :clone, git_path
      `#{git} #{git_path} #{project_full_path.join(name)}`
    end

    def project_path
      Pathname.new project_name
    end

    def project_name
      project || type
    end

    def template_name
      (project && type) || "template"
    end

    def project_full_path
      projects_home_path.join(project_name)
    end

    def project_base
      project_path.basename.to_s
    end

    def projects_home_path
      Pathname.new(projects_home)
    end

    def projects_home
      config.projects_home
    end

    def git_path
      options[:git]
    end

    def dropbox_path
      Pathname.new dropbox_home
    end

    def dropbox_path_to(path)
      dropbox_path.join(path).to_s
    end

    def dropbox_home
      Projit.config.dropbox_home
    end

    def dropbox_configured?
      config.dropbox_configured?
    end

    def config
      Projit.config
    end

    def hub_installed?
      `which hub`
      $?.success?
    end

  end

end
