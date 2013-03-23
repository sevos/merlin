require "merlin/engine"
require "merlin/webmock" if Rails.env.test?

module Merlin
  def self.method_missing(*args, &block)
    @configuration.send(*args, &block)
  end
end
