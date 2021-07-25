class MailerMailer < Devise::Mailer

  def reset_password_instructions(record, token, opts={})
    super(record, token, opts.merge(default_opts))
  end

  def reset_password_instructions(record, token, opts={})
    super(record, token, opts.merge(default_opts))
  end

  def unlock_instructions(record, token, opts={})
    super(record, token, opts.merge(default_opts))
  end

  def default_opts
    {
        bcc: Settings.mail[:bcc]
    }
  end

  mail.delivery_method :smtp, { address:   'smtp.gmail.com',
    port:      587,
    domain:    'gmail.com',
    user_name: Rails.application.credentials.gmail[:user_name],
    password:  Rails.application.credentials.gmail[:password]}

  mail.deliver

end
