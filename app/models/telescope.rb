class Telescope < ApplicationRecord
  has_many :images

  def sort_alphabetically(order)
    if order == 'clicked'
      return images.order(:name)
    else
      images
    end
  end
end