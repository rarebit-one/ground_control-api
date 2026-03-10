# frozen_string_literal: true

module GroundControl
  module Api
    module Queues
      class PausesController < ApplicationController
        before_action :set_queue

        def create
          @queue.pause

          render json: { message: "Queue paused" }
        end

        def destroy
          @queue.resume

          render json: { message: "Queue resumed" }
        end

        private

        def set_queue
          @queue = ActiveJob.queues[params[:queue_id]]
        end
      end
    end
  end
end
