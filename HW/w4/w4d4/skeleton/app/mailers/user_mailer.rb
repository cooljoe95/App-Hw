class UserMailer < ActionMailer::Base
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url = 'http://99cats.com/login'
    mail(to: user.email, subject: 'Welcome to 99 Cats Site')
  end
end
