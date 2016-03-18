class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :address
      t.string :postcode
      t.float :latitude
      t.float :longitude
    end
  end
end
