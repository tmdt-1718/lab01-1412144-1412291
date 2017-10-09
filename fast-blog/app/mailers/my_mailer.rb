require 'socket'
class MyMailer < ApplicationMailer
  default from: 'notificationsec2017@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = "//"+host_url + '/blogs/new'
    mail(to: @user.email, subject: 'Welcome to FastBlog')
  end

  def comment_email(blog, user, user_comment)
    @user = user
    @url  = "//" + host_url + "/blogs/#{blog.id}"
    puts @url
    @user_comment = user_comment
    mail(to: @user.email, subject: "#{@user_comment.name} left a comment on your blog")
  end
  def host_url

    return "radiant-plateau-45861.herokuapp.com"
  end
end
