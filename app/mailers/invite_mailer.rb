class InviteMailer < ApplicationMailer::Base
  default from: "pfuegelcx@gmail.com"

  def invite_user(email)
    @email = email
    layout "invite_user"
    mail(to: email, subject: "Create an acount at Blokmarks!")
  end
end
