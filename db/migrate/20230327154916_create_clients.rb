class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :username
      t.string :password_digest
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
