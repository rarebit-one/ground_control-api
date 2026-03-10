# frozen_string_literal: true

module GroundControl
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace GroundControl::Api

      initializer "ground_control.api.middleware" do |app|
        app.middleware.use ActionDispatch::Flash
        app.middleware.use Rack::MethodOverride
      end

      config.after_initialize do
        require "mission_control/jobs/engine"
      end
    end
  end
end
