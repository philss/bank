module Accounting
  class Engine < ::Rails::Engine
    isolate_namespace Accounting

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.assets false
      g.helper false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.view_specs false
    end

    config.autoload_paths += %W(#{config.root}/app/domain #{config.root}/app/repositories)
  end
end
