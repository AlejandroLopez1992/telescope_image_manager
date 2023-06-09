class ImagesController < ApplicationController
  def index
    @images = Image.show_only_true
    @true_images
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:image_id])
  end

  def update
    @image = Image.find(params[:image_id])
    @image.update(image_params)
    redirect_to "/images/#{@image.id}"
  end

  def destroy
    @image = Image.find(params[:image_id])
    @image.destroy
    redirect_to "/images"
  end

  private
  def image_params
    params.permit(:name, :image_description, :earth_in_view, :exif_version)
  end
end