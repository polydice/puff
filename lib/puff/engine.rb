require 'puff/instrumentation/log_subscriber'
require 'puff/instrumentation/controller_runtime'

module Puff
  class Engine < ::Rails::Engine
    initializer "puff.Instrumentation" do
      Puff::Instrumentation::LogSubscriber.attach_to(:redis)

      ActiveSupport.on_load(:action_controller) do
        include Puff::Instrumentation::ControllerRuntime
      end
    end
  end
end
