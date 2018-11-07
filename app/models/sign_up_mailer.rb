require 'sendgrid-ruby'

class SignUpMailer
  def initialize(mail_params)
    @name = mail_params['user_name']
    @mail = mail_params['email']
    @password = mail_params['password']
  end

  def template
    "<html>\n
      <body>\n
        Hello #{@name},\n
        You have chosen to get emails from Wacky Holidays.\n
        Every Time a Wacky Holiday comes up we will notify you.\n
        If you ever wish to stop the service just use your\n
        username: #{@name} and password: #{@password} to login\n
        and terminate you account.\n
        Thank You.
      </body>\n
    </html>"
  end

  def send_mail
    from = SendGrid::Email.new(email: 'noreply@wacky_holidays')
    to = SendGrid::Email.new(email: @mail)
    subject = 'Welcome to Wacky Holidays'
    content = SendGrid::Content.new(type: 'text/html', value: template)
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end
