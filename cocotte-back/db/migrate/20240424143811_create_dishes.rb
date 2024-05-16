class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes, :id => false do |t|
      t.integer :id, :primary_key => true
      t.string :name
      t.string :picture_path
      t.string :varchar
      t.string :recipe
      t.references :genre, null: false, foreign_key: true
      t.references :taste, null: false, foreign_key: true
      t.references :cooking_time, null: false, foreign_key: true

      t.timestamps
    end
  end
end
