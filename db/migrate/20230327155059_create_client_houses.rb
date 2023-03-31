class CreateClientHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :client_houses do |t|
      t.belongs_to :owner, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
