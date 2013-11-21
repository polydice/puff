require 'redis'
require 'redis/connection/hiredis'

require 'puff/version'
require 'puff/engine' if defined?(::Rails::Railtie)
require 'puff/instrumentation/log_subscriber'

module Puff
  # Generic error
  class PuffError < RuntimeError; end

  def self.config
    @config ||= YAML.load(File.open("#{Rails.root}/config/puff.yml"))[Rails.env]
  end

  def self.config=(config)
    @config = config
  end

  def self.redis
    @redis ||= ::Redis.new(Puff.config)
  end

  def self.redis=(redis)
    @redis = redis
  end

end
