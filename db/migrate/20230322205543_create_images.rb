class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :telescope, foreign_key: true
      t.string :name
      t.text :image_description
      t.boolean :earth_in_view
      t.integer :exif_version
      t.timestamps
    end
  end
end
