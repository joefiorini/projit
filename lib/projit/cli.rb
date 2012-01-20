require 'thor'
require 'projit'

module Projit
  class CLI < Thor

    desc "new TYPE NAME", "Create project named NAME under current directory using the template specified by TYPE"
    class_options git: nil
    def new(type, name=nil)
      args = ARGV.reject { |a| a == "new" }
      Projit::ProjectGenerator.start args
    end

    desc "destroy NAME", "Delete project stored in the directory named NAME"
    def destroy name
      path = File.join(Projit.config.projects_home, name)
      puts "Removing project at #{path.inspect}"
      FileUtils.rm_rf path
    end

  end
end
