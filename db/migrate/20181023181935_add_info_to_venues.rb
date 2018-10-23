class AddInfoToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :name, :string
    add_column :venues, :location, :string
    add_column :venues, :age_of_entry, :string
    add_column :venues, :capacity, :integer
    add_column :venues, :music, :string
    add_column :venues, :dress_code, :string
    add_column :venues, :website, :string
    add_column :venues, :business_type, :string
  end
end
