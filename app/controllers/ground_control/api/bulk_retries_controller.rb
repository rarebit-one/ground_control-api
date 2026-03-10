# frozen_string_literal: true

module GroundControl
  module Api
    class BulkRetriesController < ApplicationController
      def create
        jobs = ActiveJob.jobs.where(**@job_filters).failed
        count = [jobs.count, 3000].min
        jobs.limit(3000).retry_all

        render json: { message: "Retried #{count} jobs" }
      end
    end
  end
end
