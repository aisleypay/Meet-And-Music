class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to our site!')
  end

  def reach_out(recipient, sender)
    @recipient = recipient
    @sender_email = sender.email
    @sender_name = sender.meta.name

    if @recipient[:user].nil? === true
      email = @recipient[:email]
    else
      email = @recipient[:user][:email]
    end

    mail(to: email, subject: 'New Meet and Music Contact Request!')
  end
end
