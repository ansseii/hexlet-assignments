# frozen_string_literal: true

# BEGIN
require 'date'

module Model
  def initialize(attributes = {})
    @attributes = self.class.attributes_with_options.each_with_object({}) do |(name, options), hash|
      value = attributes.fetch(name, options[:default])
      hash[name] = self.class.convert value, options[:type]
    end
  end

  module ClassMethods
    attr_reader :attributes_with_options

    def attribute(name, options = {})
      @attributes_with_options ||= {}
      @attributes_with_options[name] = options

      define_method "#{name}" do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = self.class.convert value, options[:type]
      end
    end

    def convert(value, value_type)
      return nil if value.nil?

      case value_type
      when :integer
        Integer value
      when :string
        String value
      when :datetime
        DateTime.parse value
      when :boolean
        !!value
      else
        raise 'Unknown type'
      end
    end
  end

  def self.included(base_class)
    base_class.attr_reader :attributes
    base_class.extend ClassMethods
  end
end

# END
