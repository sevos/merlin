require "merlin/configuration"
require "merlin/version"

module Merlin
  def self.__configuration__
    @__configuration__ ||= Merlin::Configuration.new(config_path, env, logger)
  end
  
  def self.method_missing(*args, &block)
    raise "Environment not set" unless env
    __configuration__.send(*args, &block)
  end

  def self.config_path=(path)
    @config_path = path  
  end

  def self.config_path
    @config_path ||= "config/merlin.yml"
  end

  def self.env=(env)
    @env = env
  end

  def self.env
    @env ||= ENV["RAILS_ENV"]
  end

  def self.logger=(logger)
    @logger = logger
  end
  
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end
