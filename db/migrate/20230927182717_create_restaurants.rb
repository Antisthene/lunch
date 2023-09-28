class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.string :address
      t.string :city
      t.string :code

      t.timestamps
    end
  end
end
