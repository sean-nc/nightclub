class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :mobile, :string
    add_column :users, :gender, :string
  end
end
