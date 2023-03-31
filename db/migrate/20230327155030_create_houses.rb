class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :image_url
      t.string :location
      t.string :description
      t.integer :price

      t.belongs_to :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
