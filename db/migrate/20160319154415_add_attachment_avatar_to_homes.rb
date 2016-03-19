class AddAttachmentAvatarToHomes < ActiveRecord::Migration
  def self.up
    change_table :homes do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :homes, :avatar
  end
end
