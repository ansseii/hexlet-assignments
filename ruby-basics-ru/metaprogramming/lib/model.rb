# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    attr_reader :attributes
    protected attr_reader :attribute_options
    base.extend self
  end

  def initialize(attributes = {})
    @attributes = self.class.attribute_options.each_with_object({}) do |(name, options), hash|
      value = attributes.fetch(name, options[:default])
      hash[name] = convert_to_type value, options[:type]
    end
  end

  def attribute(name, options = {})
    @attribute_options ||= {}
    @attribute_options[name] = options

    define_method name do
      @attributes[name]
    end

    define_method "#{name}=" do |value|
      @attributes[name] = convert_to_type value, options[:type]
    end
  end

  private

  def convert_to_type(value, type)
    return nil if value.nil?

    case type
    when :integer
      Integer value
    when :string
      String value
    when :datetime
      DateTime.parse value
    when :boolean
      !!value
    else
      value
    end
  end
end
# END
