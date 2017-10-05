class PhotosController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new(source: photo_params[:source])
    @photo.views = 0
    @photo.save

    redirect_to album_path(@album)
  end
  def destroy
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy
    redirect_to album_path(@album)
  end
  def show

    @photo = Photo.find(params[:id])

  end
  private
    def photo_params
      params.require(:photo).permit(:views, :source)
    end
end
