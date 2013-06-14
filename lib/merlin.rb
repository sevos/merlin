require "merlin/configuration"
require "merlin/version"

module Merlin
  def self.method_missing(*args, &block)
    @configuration.send(*args, &block)
  end
end
