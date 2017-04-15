class Book < ApplicationRecord
  belongs_to :publisher, class_name: 'Admin::Publisher'
  has_and_belongs_to_many :authors, class_name: "Author"

  validates :title, presence: true, length: { in: 1..255 }
  validates :publisher, :authors, :published_at, presence: true
  validates :page_count, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :isbn, uniqueness: true, format: { with: /[0-9\-xX]{13}/ }
end
