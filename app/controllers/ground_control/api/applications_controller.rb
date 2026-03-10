# frozen_string_literal: true

module GroundControl
  module Api
    class ApplicationsController < ApplicationController
      def index
        applications = MissionControl::Jobs.applications

        render json: { data: ApplicationResource.new(applications).serializable_hash }
      end
    end
  end
end
