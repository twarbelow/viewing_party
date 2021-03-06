Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
  ENV['GOOGLE_CLIENT_ID'],
  ENV['GOOGLE_CLIENT_SECRET'], {
    :prompt => ['select_account','consent'],
    :access_type => "offline",
    :scope => ['email','profile','calendar'],
  }
end

## added consent and offline access type
