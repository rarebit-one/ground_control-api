# frozen_string_literal: true

module GroundControl
  module Api
    class ServerResource < BaseResource
      attribute :id, &:id
      attribute :name, &:name
    end
  end
end
