# 本番環境でメールを送るためのホストの設定
# config.action_mailer.default_url_options = {  :host =>  'https://game-reviewers.herokuapp.com/' }
#   config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
      :user_name => Rails.application.credentials.gmail[:user_name],
      :password => Rails.application.credentials.gmail[:password],
      :domain => 'gmail.com',
      :address => "smtp.gmail.com",
      :port => Settings.smtp[:port],
      :authentication => :plain,
      :enable_starttls_auto => true
    }