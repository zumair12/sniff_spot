class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :title
      t.text :description
      t.decimal :price,  precision: 10, scale: 2

      t.timestamps
    end
  end
end
