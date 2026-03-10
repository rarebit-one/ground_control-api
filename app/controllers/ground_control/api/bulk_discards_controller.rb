# frozen_string_literal: true

module GroundControl
  module Api
    class BulkDiscardsController < ApplicationController
      def create
        jobs = ActiveJob.jobs.where(**@job_filters).failed

        if active_filters?
          count = [jobs.count, 3000].min
          jobs.limit(3000).discard_all
        else
          count = jobs.count
          jobs.discard_all
        end

        render json: { message: "Discarded #{count} jobs" }
      end
    end
  end
end
