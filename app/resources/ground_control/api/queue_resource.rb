# frozen_string_literal: true

module GroundControl
  module Api
    class QueueResource < BaseResource
      attribute :id do |queue|
        queue.name.parameterize
      end

      attribute :name, &:name
      attribute :size, &:size

      attribute :active do |queue|
        queue.active?
      end

      attribute :paused do |queue|
        queue.paused?
      end
    end
  end
end
