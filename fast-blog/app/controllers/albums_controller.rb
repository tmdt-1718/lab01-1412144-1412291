class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end
  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.all
    @views_count = 0
    @photos.each do |photo|
      @views_count = @views_count + photo.views
    end
  end

  def edit
    @album = Album.find(params[:id])
  end
  def index
    @albums = Album.all
    @views_array = Array.new
    @albums.each do |album|
      views_count = 0
      album.photos.each do |photo|
        views_count = views_count + photo.views
      end
      @views_array.push(views_count)
    end
  end
  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :cover)
    end
end
