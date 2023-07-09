class RemovePasswordHashAndSalt < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_hash, :string
    remove_column :users, :password_salt, :string 
  end
end
