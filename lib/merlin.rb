require "merlin/engine"

module Merlin
  def self.method_missing(*args, &block)
    @configuration.send(*args, &block)
  end
end
