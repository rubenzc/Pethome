class AddCityToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :city, :string
  end
end
