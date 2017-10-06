class CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(user_id: current_user.id, content: comment_params[:content])
    redirect_to blog_path(@blog)
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
