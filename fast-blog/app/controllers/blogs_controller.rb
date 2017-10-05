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
      redirect_to blogs_path
    else
      render 'new'
    end


  end
  def show
    @blog = Blog.find(params[:id])
    view_counts = @blog.view_counts + 1
    @blog.update(view_counts: view_counts)
    @title = "Blogs"
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render 'edit'
    end

  end
  private
    def blog_params
      params.require(:blog).permit(:content, :image);
    end
end
