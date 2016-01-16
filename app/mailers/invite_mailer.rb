class InviteMailer < ApplicationMailer
  default from: "pfuegelcx@gmail.com"

  def invite_user(email)
    @email = email
   
    mail(to: email, subject: "Create an acount at Blokmarks!") do |format|
      format.html { render view: 'invite_user'}
    end 
  end
end
