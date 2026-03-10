# frozen_string_literal: true

module GroundControl
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace GroundControl::Api
    end
  end
end
