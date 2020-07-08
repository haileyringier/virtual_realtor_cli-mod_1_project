class CreateHousesTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :houses do |t|
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :yard
      t.string :location
    end
  end

  # def all_houses
  # end

end

