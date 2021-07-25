class MailerMailer < Devise::Mailer
  default from: 'notifications@example.com'

  def reset_password_email(user)
    @user = user
    @url = edit_password_url(@user.reset_password_token)
    mail(to: user.email, subject: Settings.mail.reset_password)
  end

  def default_opts
    {
        bcc: Settings.mail[:bcc]
    }
  end

  # mail.delivery_method :smtp, { address:   'smtp.gmail.com',
  #   port:      587,
  #   domain:    'gmail.com',
  #   user_name: Rails.application.credentials.gmail[:user_name],
  #   password:  Rails.application.credentials.gmail[:password]}

  # mail.deliver

end
