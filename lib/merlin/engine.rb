module Merlin
  class Engine < ::Rails::Engine
    isolate_namespace Merlin

    require 'yaml'

    config.generators do |g|
      g.test_framework :rspec, fixture: false, view_specs: false,
                               request_specs: false, routing_specs: false
      g.template_engine false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end
  end
end
