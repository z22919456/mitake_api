module MitakeApi
  module Generators
    class I18nGenerator < Rails::Generators::Base
      source_root File.expand_path(__dir__)

      def copy_locale_yml
        template './zh-TW.yaml', File.join('config/locales/', 'mitake_api.yml')
      end
    end
  end
end
