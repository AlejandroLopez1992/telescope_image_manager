class TelescopesController < ApplicationController
  def index
    @telescopes = Telescope.all
  end

  def show  
    @telescope = Telescope.find(params[:id])
  end
end