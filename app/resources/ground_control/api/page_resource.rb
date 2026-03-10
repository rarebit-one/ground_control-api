# frozen_string_literal: true

module GroundControl
  module Api
    class PageResource
      include Alba::Resource

      transform_keys :lower_camel

      attribute :page do |page|
        page.index
      end

      attribute :page_size, &:page_size

      attribute :total_count do |page|
        count = page.total_count
        count.infinite? ? nil : count
      rescue NoMethodError
        count
      end

      attribute :pages_count, &:pages_count

      attribute :first do |page|
        page.first?
      end

      attribute :last do |page|
        page.last?
      end

      attribute :records do |page|
        if @inner_resource_class
          @inner_resource_class.new(page.records).serializable_hash
        else
          page.records.map(&:to_h)
        end
      end

      def initialize(object, inner_resource_class: nil)
        @inner_resource_class = inner_resource_class
        super(object)
      end
    end
  end
end
