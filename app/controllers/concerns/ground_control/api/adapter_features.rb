# frozen_string_literal: true

module GroundControl
  module Api
    module AdapterFeatures
      extend ActiveSupport::Concern

      private

      def supported_job_statuses
        MissionControl::Jobs::Current.server.queue_adapter.supported_job_statuses
      end

      def queue_pausing_supported?
        MissionControl::Jobs::Current.server.queue_adapter.supports_queue_pausing?
      end

      def workers_exposed?
        MissionControl::Jobs::Current.server.queue_adapter.exposes_workers?
      end

      def recurring_tasks_supported?
        MissionControl::Jobs::Current.server.queue_adapter.supports_recurring_tasks?
      end

      def adapter_features
        {
          statuses: supported_job_statuses,
          queue_pausing: queue_pausing_supported?,
          workers: workers_exposed?,
          recurring_tasks: recurring_tasks_supported?
        }
      end
    end
  end
end
