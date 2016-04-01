# Puff

Puff provides Redis integration and instrumentation for Rails.

## Features

* Simple integration (Put your server info in config/puff.yml)
* Rails instrumentation (Using ActiveSupport::Notifications)


## Installation

Add this line to your application's Gemfile:

    gem 'puff'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puff
    
## Simple Usage (just for instrumentation)

Just add it to your `Gemfile`, done.

```
gem 'hiredis'
gem 'redis', :require => ["redis", "redis/connection/hiredis"]
gem 'puff', git: "https://github.com/yyyc514/puff.git"
```

The included Rails engine will automatically start adding instrumentation to your log files without the need to do anything further.

## Deprecated Usage

After put puff in your `Gemfile`, use the generator to generate default config file.

```
rails g puff:config
```

To use Redis in your Rails apps, using the singleton method:

```
irb(main):001:0> redis = Puff.redis
=> #<Redis client v3.0.2 for redis://localhost:6379/0>
irb(main):002:0> redis.ping
=> "PONG"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
