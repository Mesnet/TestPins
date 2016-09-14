class AddMoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :pseudo, :string
    add_column :users, :city, :string
    add_column :users, :influscore, :integer
  end
end
