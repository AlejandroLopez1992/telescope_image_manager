class Image < ApplicationRecord
  belongs_to :telescope

  def self.show_only_true
    @true_images = Image.where(earth_in_view: true)
  end
end