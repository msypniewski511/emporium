class AddAttachmentPictureToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :books, :picture
  end
end
