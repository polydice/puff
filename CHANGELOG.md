## 0.4.0

* Support Rails 4
* **Breaking**: Remove Redis singleton along with configuration. Use `Redis.current` and `ENV["REDIS_URL"]` instead.
* Remove hiredis
