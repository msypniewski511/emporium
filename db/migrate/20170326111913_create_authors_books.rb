class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_books, id: false do |t|
      t.integer :author_id, null: false
      t.integer :book_id, null: false
    end
    # Add foreign key reference to books_authors table
    execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_bk_authors FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE'
    execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_bk_books FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE'
  end
end
