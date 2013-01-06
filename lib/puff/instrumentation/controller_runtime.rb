module Puff
  module Instrumentation
    module ControllerRuntime
      extend ActiveSupport::Concern

      protected

      attr_internal :redis_runtime_before_render
      attr_internal :redis_runtime_during_render

      def cleanup_view_runtime
        self.redis_runtime_before_render = Puff::Instrumentation::LogSubscriber.reset_runtime
        runtime = super
        self.redis_runtime_during_render = Puff::Instrumentation::LogSubscriber.reset_runtime
        runtime - redis_runtime_during_render
      end

      def append_info_to_payload(payload)
        super
        payload[:redis_runtime] = (redis_runtime_before_render || 0) +
                                                  (redis_runtime_during_render || 0)  +
                                                  Puff::Instrumentation::LogSubscriber.reset_runtime
      end

      module ClassMethods
        def log_process_action(payload)
          messages, redis_runtime = super, payload[:redis_runtime]
          messages << ("Redis: %.1fms" % redis_runtime.to_f) if redis_runtime
          messages
        end
      end
    end
  end
end
