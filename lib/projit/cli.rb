require 'thor'
require 'projit'

module Projit
  class CLI < Thor

    desc "new NAME", "Create project named NAME under current directory or CLIENT if specified"
    def new(name)
      Projit::ProjectGenerator.start [name]
    end

  end
end
