ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address                    => 'smtp.sendgrid.net',
  :port                       => '2525',
  :authentication             => :plain,
  :user_name                  => 'app45863107@heroku.com',
  :password                   =>  'sbec41py9147',
  :domain                     => 'heroku.com',
  :enable_starttls_auto       => true
}