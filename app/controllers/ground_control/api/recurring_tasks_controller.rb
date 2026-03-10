# frozen_string_literal: true

module GroundControl
  module Api
    class RecurringTasksController < ApplicationController
      before_action :ensure_recurring_tasks_supported

      def index
        tasks = MissionControl::Jobs::Current.server.recurring_tasks

        render json: { data: RecurringTaskResource.new(tasks).serializable_hash }
      end

      def show
        task = MissionControl::Jobs::Current.server.find_recurring_task(params[:id])
        page = MissionControl::Jobs::Page.new(task.jobs, page: params[:page].to_i, page_size: GroundControl::Api.page_size)

        render json: {
          data: RecurringTaskResource.new(task).serializable_hash,
          jobs: PageResource.new(page, inner_resource_class: JobResource).serializable_hash
        }
      end

      def update
        task = MissionControl::Jobs::Current.server.find_recurring_task(params[:id])
        task.enqueue

        render json: { message: "Enqueued recurring task #{task.id}" }
      end

      private

      def ensure_recurring_tasks_supported
        unless recurring_tasks_supported?
          render json: { error: "Recurring tasks not supported by this adapter" }, status: :not_found
        end
      end
    end
  end
end
