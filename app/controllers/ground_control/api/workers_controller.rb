# frozen_string_literal: true

module GroundControl
  module Api
    class WorkersController < ApplicationController
      before_action :ensure_workers_exposed

      def index
        page = MissionControl::Jobs::Page.new(
          MissionControl::Jobs::Current.server.workers_relation,
          page: params[:page].to_i,
          page_size: GroundControl::Api.page_size
        )

        render json: { data: PageResource.new(page, inner_resource_class: WorkerResource).serializable_hash }
      end

      def show
        worker = MissionControl::Jobs::Current.server.find_worker(params[:id])

        render json: { data: WorkerResource.new(worker).serializable_hash }
      end

      private

      def ensure_workers_exposed
        unless workers_exposed?
          render json: { error: "Workers not supported by this adapter" }, status: :not_found
        end
      end
    end
  end
end
