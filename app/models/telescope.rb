class Telescope < ApplicationRecord
  has_many :images

  def sort_alphabetically(order)
    if order == 'clicked'
      return images.order(:name) if order == 'clicked'
    else
      images
    end
  end
end