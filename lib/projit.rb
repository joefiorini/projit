require "projit/version"
require 'yaml'

module Projit

  autoload :CLI,              'projit/cli'
  autoload :Config,           'projit/config'
  autoload :ProjectGenerator, 'projit/project_generator'

  def self.config
    @config ||= load_config!
    @config
  end

  def self.load_config!
    Config.new
  end

end
