class CreateAdminPublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_publishers do |t|
      t.string :name, :limit => 255, :null => false, :unique => true
      t.timestamps
    end
  end
end
