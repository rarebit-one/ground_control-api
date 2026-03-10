# frozen_string_literal: true

module GroundControl
  module Api
    class FeaturesController < ApplicationController
      def show
        render json: { data: adapter_features }
      end
    end
  end
end
