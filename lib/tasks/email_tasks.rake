desc 'send email for the day'

task send_email_for_the_day: :environment do
  UnofficialHoliday.cron_mailer
end
