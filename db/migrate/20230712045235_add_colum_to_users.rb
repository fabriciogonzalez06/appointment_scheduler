class AddColumToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :string, default: 'client'
  end
end
