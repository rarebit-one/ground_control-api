# frozen_string_literal: true

module GroundControl
  module Api
    class RecurringTaskResource < BaseResource
      attribute :id, &:id
      attribute :job_class_name, &:job_class_name
      attribute :command, &:command
      attribute :arguments, &:arguments
      attribute :schedule, &:schedule
      attribute :last_enqueued_at, &:last_enqueued_at
      attribute :next_time, &:next_time
      attribute :queue_name, &:queue_name
      attribute :priority, &:priority
    end
  end
end
