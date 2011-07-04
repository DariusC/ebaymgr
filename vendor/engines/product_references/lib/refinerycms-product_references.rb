require 'refinerycms-base'

module Refinery
  module ProductReferences
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "product_references"
          plugin.activity = {
            :class => ProductReference,
            :title => 'sku'
          }
        end
      end
    end
  end
end
