# frozen_string_literal: true

module GroundControl
  module Api
    class RetriesController < ApplicationController
      def create
        job = ActiveJob.jobs.failed.find_by_id(params[:job_id])
        job.retry

        render json: { message: "Retried job #{job.job_id}" }
      end
    end
  end
end
