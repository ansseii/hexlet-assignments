# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable
  def_delegators :@uri, :scheme, :host, :port

  def initialize(url)
    @uri = URI.parse url
    query = @uri.query || ''
    @query_params = Hash[URI.decode_www_form query].transform_keys(&:to_sym)
  end

  def query_params
    @query_params
  end

  def query_param(key, default = nil)
    @query_params.fetch key, default
  end

  def <=>(other)
    [scheme, host, port, query_params] <=> [other.scheme, other.host, other.port, other.query_params]
  end
end

# END
