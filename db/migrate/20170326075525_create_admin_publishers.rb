class CreateAdminPublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_publishers do |t|
      t.string :name, null: false, unique: true, limit: 255

      t.timestamps
    end
  end
end
