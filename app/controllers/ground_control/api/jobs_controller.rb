# frozen_string_literal: true

module GroundControl
  module Api
    class JobsController < ApplicationController
      def index
        status = params[:status]
        jobs = ActiveJob.jobs.where(**@job_filters).with_status(status)
        page = MissionControl::Jobs::Page.new(jobs, page: params[:page].to_i, page_size: GroundControl::Api.page_size)

        job_class_names = begin
          ActiveJob.jobs.with_status(status).job_class_names
        rescue
          []
        end

        queue_names = ActiveJob.queues.map(&:name)

        render json: {
          data: PageResource.new(page, inner_resource_class: JobResource).serializable_hash,
          meta: {
            status: status,
            filters: @job_filters,
            job_class_names: job_class_names,
            queue_names: queue_names
          }
        }
      end

      def show
        job = ActiveJob.jobs.find_by_id(params[:id])

        render json: { data: JobResource.new(job).serializable_hash }
      end
    end
  end
end
