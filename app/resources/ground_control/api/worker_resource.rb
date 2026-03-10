# frozen_string_literal: true

module GroundControl
  module Api
    class WorkerResource < BaseResource
      attribute :id, &:id
      attribute :name, &:name
      attribute :hostname, &:hostname
      attribute :last_heartbeat_at, &:last_heartbeat_at
      attribute :configuration, &:configuration
      attribute :raw_data, &:raw_data
    end
  end
end
