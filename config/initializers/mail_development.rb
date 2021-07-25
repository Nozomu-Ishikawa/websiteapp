# 開発環境でメールを送るためのホストの設定
config.action_mailer.perform_caching = true
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.raise_delivery_errors = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address => Settings.smtp[:address],
  :port => Settings.smtp[:port],
  :domain => Settings.smtp[:domain],
  :user_name => Settings.smtp[:user_name], 
  :password => Settings.smtp[:password],
  :authentication => 'login',
  :enable_starttls_auto => true
}