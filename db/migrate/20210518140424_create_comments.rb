class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.string :body
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end