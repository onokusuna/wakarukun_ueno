class CreateCongestions < ActiveRecord::Migration[5.2]
  def change
    create_table :congestions do |t|
      t.integer "user_id", null: false
      t.integer "exhibition_id", null: false
      t.integer :high, null: false
      t.integer :middle, null: false
      t.integer :low, null: false

      t.timestamps
    end
  end
end
