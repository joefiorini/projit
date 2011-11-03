require 'thor'
require 'projit'

module Projit
  class CLI < Thor

    desc "new NAME", "Create project named NAME under current directory or CLIENT if specified"
    class_options dropbox: false, git: nil, type: nil
    def new(name)
      args = ARGV.reject { |a| a == "new" }
      Projit::ProjectGenerator.start args
    end

  end
end
