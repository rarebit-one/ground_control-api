# frozen_string_literal: true

module GroundControl
  module Api
    class QueuesController < ApplicationController
      def index
        queues = ActiveJob.queues.sort_by(&:name)

        render json: {
          data: QueueResource.new(queues).serializable_hash,
          meta: { features: adapter_features }
        }
      end

      def show
        queue = ActiveJob.queues[params[:id]]
        page = MissionControl::Jobs::Page.new(queue.jobs, page: params[:page].to_i, page_size: GroundControl::Api.page_size)

        render json: {
          data: QueueResource.new(queue).serializable_hash,
          jobs: PageResource.new(page, inner_resource_class: JobResource).serializable_hash
        }
      end
    end
  end
end
