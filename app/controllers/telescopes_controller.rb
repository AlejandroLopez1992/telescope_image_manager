class TelescopesController < ApplicationController
  def index
    @telescopes = Telescope.all.order(created_at: :desc)
  end
  
  def show  
    @telescope = Telescope.find(params[:id])
  end
end