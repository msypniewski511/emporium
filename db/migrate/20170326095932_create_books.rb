class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 255
      t.integer :publisher_id, null: false
      t.datetime :published_at
      t.string :isbn, limit: 13, unique: true
      t.text :blurb
      t.integer :page_count
      t.float :price

      t.timestamps
    end

    # add foreign key reference to publisher table
    execute 'ALTER TABLE books ADD CONSTRAINT fk_books_bublishers FOREIGN KEY (publisher_id) REFERENCES admin_publishers(id) ON DELETE CASCADE'
  end
end