class TelescopesController < ApplicationController
  def index
    @telescopes = Telescope.all.order(created_at: :desc)
  end
  
  def show  
    @telescope = Telescope.find(params[:id])
  end

  def new
  end

  def create
    @telescope = Telescope.create(telescope_params)
    redirect_to "/telescopes"
  end

  def edit
    @telescope = Telescope.find(params[:id])
  end

  def update
    @telescope = Telescope.find(params[:id])
    @telescope.update(telescope_params)
    redirect_to "/telescopes/#{@telescope.id}"
  end

private
  def telescope_params
    params.permit(:name, :functioning, :orbital_period, :launch_date, :mission, :main_telescope_type)
  end
end