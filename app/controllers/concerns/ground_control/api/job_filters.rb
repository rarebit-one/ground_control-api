# frozen_string_literal: true

module GroundControl
  module Api
    module JobFilters
      extend ActiveSupport::Concern

      included do
        before_action :set_filters
      end

      private

      def set_filters
        filter = params[:filter] || {}

        job_class_name = filter[:job_class_name]&.strip.presence
        queue_name = filter[:queue_name]&.strip.presence
        finished_at = build_finished_at_range(filter)

        @job_filters = {
          job_class_name: job_class_name,
          queue_name: queue_name,
          finished_at: finished_at
        }.compact
      end

      def build_finished_at_range(filter)
        start_time = filter[:finished_at_start].present? ? Time.zone.parse(filter[:finished_at_start]) : nil
        end_time = filter[:finished_at_end].present? ? Time.zone.parse(filter[:finished_at_end]) : nil

        return nil unless start_time || end_time

        (start_time..end_time)
      end

      def active_filters?
        @job_filters.present?
      end
    end
  end
end
