class AddBookCoverColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :books, :cover_image, :string
  end
end
