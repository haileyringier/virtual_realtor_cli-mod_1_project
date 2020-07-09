class AddAddressToHouseTable < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :address, :string
  end
end
