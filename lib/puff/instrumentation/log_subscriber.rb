require 'puff/Instrumentation/redis'

module Puff
  module Instrumentation
    class LogSubscriber < ActiveSupport::LogSubscriber
      def self.runtime=(value)
          Thread.current["redis_runtime"] = value
        end

        def self.runtime
          Thread.current["redis_runtime"] ||= 0
        end

        def self.reset_runtime
          rt, self.runtime = runtime, 0
          rt
        end

      def request(event)
        self.class.runtime += event.duration
        return unless logger.debug?

        name = "%s (%.2fms)" % ["Redis", event.duration]
        cmds = event.payload[:commands]

        output = "  #{color(name, RED, true)}"

        cmds.each do |name, *args|
          if args.present?
            output << "  #{name.to_s.upcase} #{args.join(" ")}"
          else
            output << "  #{name.to_s.upcase}"
          end
        end

        debug output
      end
    end
  end
end
