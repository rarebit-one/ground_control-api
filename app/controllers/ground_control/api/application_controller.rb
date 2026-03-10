# frozen_string_literal: true

module GroundControl
  module Api
    class ApplicationController < ActionController::API
      include MissionControl::Jobs::ApplicationScoped
      include JobFilters
      include AdapterFeatures
      include ErrorHandling

      before_action :authenticate!

      private

      def authenticate!
        GroundControl::Api.authenticate_with&.call(self)
      end

      def serialize(resource)
        resource.serializable_hash
      end
    end
  end
end
