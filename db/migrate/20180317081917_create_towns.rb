class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :Ville
      t.string :Code_Postal
      t.string :Latitude
      t.string :Longitude

      t.timestamps
    end
  end
end
