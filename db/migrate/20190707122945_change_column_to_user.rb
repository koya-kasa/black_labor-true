class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password_digest, :string
    add_column :users, :password_digest, :string, unique: true, null: false
  end
  
  def down
    change_column　:users, :password_digest, :string
  end
end
