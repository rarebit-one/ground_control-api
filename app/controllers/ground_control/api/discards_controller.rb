# frozen_string_literal: true

module GroundControl
  module Api
    class DiscardsController < ApplicationController
      def create
        job = ActiveJob.jobs.find_by_id(params[:job_id])
        job.discard

        render json: { message: "Discarded job #{job.job_id}" }
      end
    end
  end
end
