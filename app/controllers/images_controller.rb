class ImagesController <ApplicationController
  def index
    @images = Image.all
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

  private
  def image_params
    params.permit(:name, :image_description, :earth_in_view, :exif_version)
  end
end