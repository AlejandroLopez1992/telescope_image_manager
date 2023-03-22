class CreateTelescopes < ActiveRecord::Migration[5.2]
  def change
    create_table :telescopes do |t|
      t.string :name
      t.boolean :functioning
      t.float :orbital_period
      t.datetime :launch_date
      t.text :mission
      t.string :main_telescope_type
      t.timestamps
    end
  end
end
