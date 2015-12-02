class AddAttachmentAvatarToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :items, :avatar
  end
end
