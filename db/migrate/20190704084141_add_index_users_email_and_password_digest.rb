class AddIndexUsersEmailAndPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email
    add_index :users, :password_digest 
  end
end
