class TelescopeImagesController < ApplicationController
  def index
    @telescope = Telescope.find(params[:telescope_id])
    @images = @telescope.images
  end
end