# Based on production, but with a few tweaks.
require Rails.root + 'config/environments/production'

WetapApi::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_mailer.default_url_options = { :host => 'wetap-staging.herokuapp.com' }
end
