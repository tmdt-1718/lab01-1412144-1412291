class MyMailer < ApplicationMailer
  default from: 'notificationsec2017@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = '/blog/new'
    mail(to: @user.email, subject: 'Welcome to FastBlog')
  end

  def comment_email(user)
    @user = user
    @url  = '/blog/new'
    mail(to: @user.email, subject: 'Welcome to FastBlog')
  end
end
