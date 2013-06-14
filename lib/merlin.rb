require "merlin/configuration"
require "merlin/version"

module Merlin
  
  def self.method_missing(*args, &block)
    logger = @logger || Logger.new(STDOUT)
    raise "Missing configuration path -> Merlin.config_path = '...'" unless @config_path
    raise "Missing environment -> Merlin.env = :production" unless @env
    Merlin::Configuration.new(@config_path, @env, logger).send(*args, &block)
  end

  def self.config_path=(path)
    @config_path = path  
  end

  def self.env=(e)
    @env = e
  end

  def self.logger=(logger)
    @logger = logger
  end
end
