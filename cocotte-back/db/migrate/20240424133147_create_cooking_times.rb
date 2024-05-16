class CreateCookingTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :cooking_times, :id => false do |t|
      t.integer :id, :primary_key => true
      t.string :cooking_time

      t.timestamps
    end
  end
end
