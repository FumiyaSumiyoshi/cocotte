class CreateTastes < ActiveRecord::Migration[7.1]
  def change
    create_table :tastes, :id => false do |t|
      t.integer :id, :primary_key => true
      t.string :taste

      t.timestamps
    end
  end
end
