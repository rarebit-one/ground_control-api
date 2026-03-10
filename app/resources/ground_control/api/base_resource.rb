# frozen_string_literal: true

require "alba"

module GroundControl
  module Api
    class BaseResource
      include Alba::Resource

      transform_keys :lower_camel
    end
  end
end
