class CreateGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :genres, :id => false do |t|
      t.integer :id, :primary_key => true
      t.string :genre

      t.timestamps
    end
  end
end
