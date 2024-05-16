class CreateCreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :create_tests do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
