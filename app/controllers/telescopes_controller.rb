class TelescopesController < ApplicationController
  def index
    @telescopes = Telescope.all
  end
end