class BlogsController < ApplicationController
  def new
    @blog = Blog.new
    @title="New Blogs"
  end
  def index
    @blogs = Blog.all
    @title = "Blogs"
  end
  def create
    @blog = Blog.new(blog_params)
    @blog.view_counts=0
    @blog.user_id = current_user.id
    if @blog.save
    else
      p @blog.errors
    end

    redirect_to blogs_path
  end
  def show
    @blog = Blog.find(params[:id])
    @title = "Blogs"
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end
  private
    def blog_params
      params.require(:blog).permit(:content, :image);
    end
end
