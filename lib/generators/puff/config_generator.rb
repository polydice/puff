require 'rails/generators'

module Puff
  module Generators
    class ConfigGenerator < ::Rails::Generators::Base
      desc "Creates a Puff configuration file at config/puff.yml"

      source_root File.expand_path('../templates', __FILE__)

      def create_config_file
        template 'puff.yml', File.join('config', "puff.yml")
      end

    end
  end
end
