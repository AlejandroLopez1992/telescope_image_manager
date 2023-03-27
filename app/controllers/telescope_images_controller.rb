class TelescopeImagesController < ApplicationController
  def index
    @telescope = Telescope.find(params[:telescope_id])
    @images = @telescope.images
  end

  def new
    @telescope = Telescope.find(params[:telescope_id])
  end

  def create
    @telescope = Telescope.find(params[:telescope_id])
    @telescope.images.create(image_params)
    redirect_to "/telescopes/#{@telescope.id}/images"
  end

private
  def image_params
    params.permit(:name, :image_description, :earth_in_view, :exif_version)
  end
end