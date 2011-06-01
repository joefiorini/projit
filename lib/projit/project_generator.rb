require 'thor/group'
require 'projit'

module Projit

  class ProjectGenerator < Thor::Group
    include Thor::Actions

    source_root "~/.projit"

    argument :project
    class_options dropbox: false

    def new
      apply projit_template
    end


    protected

      def projit_template
        File.expand_path("~/.projit/template.rb")
      end

      def in_project_root(&block)
        inside projects_home.to_s, &block
      end

      def in_project_directory(&block)
        inside projects_home_path.join(project), &block
      end

      def create_link_in_dropbox(name)
        return unless options[:dropbox]
        unless dropbox_configured?
          say "How can I create a link to your Dropbox if you haven't told me where in your Dropbox to create it? Please add a value for 'dropbox_home' to ~/.projit/config."
          return
        end
        create_link dropbox_path_to(name), projects_home_path.join(project).to_s
      end

      def project_path
        Pathname.new project
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

  end

end
