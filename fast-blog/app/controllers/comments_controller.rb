class CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @user = User.find(@blog.user_id)
    @comment = @blog.comments.new(user_id: current_user.id, content: comment_params[:content])
    if @comment.save
      MyMailer.comment_email(@blog,@user,current_user).deliver_later
      redirect_to blog_path(@blog)
    end
  end

  def destroy

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_path(params[:blog_id])
  end
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
