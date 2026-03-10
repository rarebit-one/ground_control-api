# frozen_string_literal: true

module GroundControl
  module Api
    module ErrorHandling
      extend ActiveSupport::Concern

      included do
        rescue_from ActiveJob::Errors::JobNotFoundError do |_exception|
          render json: { error: "Job not found" }, status: :not_found
        end

        rescue_from MissionControl::Jobs::Errors::ResourceNotFound do |exception|
          render json: { error: exception.message }, status: :not_found
        end

        rescue_from StandardError do |exception|
          raise exception unless Rails.env.production?

          render json: { error: "Internal server error" }, status: :internal_server_error
        end
      end
    end
  end
end
