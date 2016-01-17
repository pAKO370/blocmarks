class InviteMailer < ApplicationMailer
  default from: "pfuegelcx@gmail.com"

  def invite_user(email)
    @email = email
   
    mail(to: email, subject: "Create an acount at Blokmarks!") 
  end
end
