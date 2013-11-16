# Monkey Patching for profit.

class Redis
  class Client
    alias :old_logging :logging

    def logging(commands, &block)
      ::ActiveSupport::Notifications.instrument('request.redis', commands: commands) do
        return old_logging(commands, &block)
      end
    end
  end
end
