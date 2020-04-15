class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.date :start
      t.date :end
      t.string :image, null: false
      t.string :status, default: "To Be", null: false

      t.timestamps
    end
  end
end
