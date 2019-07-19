class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 15, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, limit: 20, unique: true, null: false
      t.text :profile, limit: 1000

      t.timestamps
    end
  end
end
