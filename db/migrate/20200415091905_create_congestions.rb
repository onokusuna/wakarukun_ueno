class CreateCongestions < ActiveRecord::Migration[5.2]
  def change
    create_table :congestions do |t|
      t.integer "user_id", null: false
      t.integer "exhibition_id", null: false
      t.string :condition, null: false

      t.timestamps
    end
  end
end
