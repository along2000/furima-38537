require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Furima38537
  class Application < Rails::Application
    before_action :configure_permitted_parameters, if: :devise_controller?
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    before_action :configre_permitted_parameters, if: :devise_controller?
private
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end