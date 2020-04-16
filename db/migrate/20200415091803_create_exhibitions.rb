class CreateExhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string :name, null: false
      t.string :place, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.string :image, null: false
      t.text :description, null: false
      t.text :summary, null: false
      t.string :status, default: "To Be", null: false

      t.timestamps
    end
  end
end
