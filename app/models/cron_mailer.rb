require 'sendgrid-ruby'

class CronMailer
  def initialize(message, user)
    @message = message
    @name = user[:user_name]
    @mail = user[:email]
  end

  def template
    "<html>\n
      <body>\n
        Hello #{@name},\n
        #{@message}.\n
        Find a way to celebrate!
      </body>\n
    </html>"
  end

  def mail_cron
    from = SendGrid::Email.new(email: 'noreply@wacky_holidays')
    to = SendGrid::Email.new(email: @mail)
    subject = 'A reason to celebrate from Wacky Holidays'
    content = SendGrid::Content.new(type: 'text/html', value: template)
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
