class Admin::Publisher < ApplicationRecord
  has_many :books, class_name: "Book"
  validates :name, presence: true, uniqueness: true, length: { in: 2..255}
end
