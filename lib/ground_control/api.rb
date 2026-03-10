# frozen_string_literal: true

require "mission_control/jobs"

require_relative "api/version"
require_relative "api/engine"

module GroundControl
  module Api
    class Error < StandardError; end

    mattr_accessor :authenticate_with
    mattr_accessor :page_size, default: 10
  end
end
