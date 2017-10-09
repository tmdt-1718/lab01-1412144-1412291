class MyMailer < ApplicationMailer
  default from: 'notificationsec2017@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = '/blog/new'
    mail(to: @user.email, subject: 'Welcome to FastBlog')
  end

  def comment_email(blog, user, user_comment)
    @user = user
    @url  = "/blog/#{blog.id}"
    @user_comment = user_comment
    mail(to: @user.email, subject: "#{@user_comment.name} left a comment on your blog")
  end
end
