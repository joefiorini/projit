require 'thor/group'

module Projit

  class ProjectGenerator < Thor::Group
    include Thor::Actions

    source_root "~/.projit"

    argument :project

    def new
      apply projit_template
    end


    private

      def projit_template
        File.expand_path("~/.projit/template.rb")
      end

      def in_project_root(&block)
        inside projects_root.to_s, &block
      end

      def in_project_directory(&block)
        inside projects_root.join(project), &block
      end

      def projects_root
        Projit.config.projects_home
      end

  end

end
