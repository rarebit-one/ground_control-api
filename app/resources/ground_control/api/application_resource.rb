# frozen_string_literal: true

module GroundControl
  module Api
    class ApplicationResource < BaseResource
      attribute :id, &:id
      attribute :name, &:name

      many :servers, resource: ServerResource
    end
  end
end
