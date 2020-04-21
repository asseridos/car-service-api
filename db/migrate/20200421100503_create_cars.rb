class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :plate_number
      t.string :brand
      t.integer :price

      t.timestamps
    end
  end
end
