# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  extend Forwardable
  include Comparable
  def_delegators :@url, :scheme, :host, :port

  def initialize(url)
    @url = URI(url)
    @params = Hash[URI.decode_www_form(@url.query ||= '')].transform_keys(&:to_sym)
  end

  def query_params
    @params
  end

  def query_param(key, default = nil)
    query_params.fetch key, default
  end

  def <=>(other_url)
    [@url.scheme, @url.host, @url.port.to_i, @params] <=>
      [other_url.scheme, other_url.host, other_url.port.to_i, other_url.query_params]
  end
end

# END
