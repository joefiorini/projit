require "projit/version"
require 'yaml'

module Projit

  autoload :CLI,              'projit/cli'
  autoload :ProjectGenerator, 'projit/project_generator'

  def self.config
    @config ||= load_config!
    @config
  end

  def self.load_config!
    YAML.load_file("~/.projit/config")
  end

end
