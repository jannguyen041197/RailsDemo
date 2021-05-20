class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :size
      t.string :color
      t.string :brand
      t.string :seller
      t.string :description

      t.timestamps
    end
  end
end
