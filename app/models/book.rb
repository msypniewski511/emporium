class Book < ApplicationRecord
  belongs_to :publisher, class_name: 'Admin::Publisher'
  has_and_belongs_to_many :authors, class_name: "Author"

  #file_column :cover_image
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  do_not_validate_attachment_file_type :picture
  validates :title, presence: true, length: { in: 1..255 }
  validates :publisher, :authors, :published_at, presence: true
  validates :page_count, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :isbn, uniqueness: true, format: { with: /[0-9\-xX]{13}/ }
  validates :isbn, length: {is: 13}
end
