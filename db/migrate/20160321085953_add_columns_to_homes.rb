class AddColumnsToHomes < ActiveRecord::Migration
  def change
  	#TABLA, COLUMNA, TIPO
  	add_column :homes, :state, :string
  	add_column :homes, :max_pets, :integer
  	add_column :homes, :type_pet, :string
  	add_column :homes, :name, :string
  	add_column :homes, :email, :string
  	add_column :homes, :phone_number, :integer
  end
end
