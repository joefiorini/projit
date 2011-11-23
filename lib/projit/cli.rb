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

  end
end
