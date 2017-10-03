class PhotosController < ApplicationController
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(source: photo_params[:source])
    redirect_to album_path(@album)
  end
  def destroy
    @album = Album.find(params[:album_id])
    @photo = @album.photos.find(params[:id])
    @photo.destroy
    redirect_to album_path(@album)
  end

  private
    def photo_params
      params.require(:photo).permit(:views, :source)
    end
end
