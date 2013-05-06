module Merlin
  class Engine < ::Rails::Engine
    isolate_namespace Merlin

    require 'yaml'
    require 'ostruct/extensions'
    require 'faraday'
    require 'faraday_middleware'

    config.generators do |g|
      g.test_framework :rspec, fixture: false, view_specs: false,
                               request_specs: false, routing_specs: false
      g.template_engine false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    initializer 'merlin.load_config', :before => :load_config_initializers do |app|
      Merlin.instance_eval do
        @configuration = Merlin::Configuration.new(File.join(::Rails.root, 'config', 'merlin.yml'))
      end
    end
  end
end
