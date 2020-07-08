class CreateViewingsTable < ActiveRecord::Migration[6.0]
  
  def change
    create_table :viewings do |t|
      t.references :client
      t.references :house
    end
  end

end
