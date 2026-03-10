# frozen_string_literal: true

module GroundControl
  module Api
    class JobResource < BaseResource
      attribute :job_id, &:job_id
      attribute :job_class_name, &:job_class_name
      attribute :queue_name, &:queue_name

      attribute :status do |job|
        job.status.to_s
      end

      attribute :arguments do |job|
        if job.respond_to?(:filtered_raw_data) && job.filtered_raw_data
          job.filtered_raw_data
        else
          job.arguments
        end
      end

      attribute :priority, &:priority
      attribute :executions, &:executions
      attribute :scheduled_at, &:scheduled_at
      attribute :finished_at, &:finished_at
      attribute :started_at, &:started_at
      attribute :failed_at, &:failed_at

      attribute :last_execution_error do |job|
        error = job.last_execution_error
        next nil if error.nil?

        {
          error_class: error.error_class,
          message: error.message,
          backtrace: error.backtrace
        }
      end

      attribute :blocked_by, &:blocked_by
      attribute :blocked_until, &:blocked_until
      attribute :worker_id, &:worker_id
      attribute :raw_data, &:raw_data
    end
  end
end
