# frozen_string_literal: true

module GroundControl
  module Api
    class DispatchesController < ApplicationController
      def create
        job = ActiveJob.jobs.find_by_id(params[:job_id])
        job.dispatch

        render json: { message: "Dispatched job #{job.job_id}" }
      end
    end
  end
end
