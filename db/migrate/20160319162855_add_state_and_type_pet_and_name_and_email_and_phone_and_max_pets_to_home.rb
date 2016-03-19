class AddStateAndTypePetAndNameAndEmailAndPhoneAndMaxPetsToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :state, :string
    add_column :homes, :type_pet, :string
    add_column :homes, :name, :string
    add_column :homes, :email, :email
    add_column :homes, :phone, :integer
    add_column :homes, :max_pets, :integer
  end
end
