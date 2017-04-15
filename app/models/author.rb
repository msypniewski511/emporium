class Author < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_and_belongs_to_many :books, class_name: 'Book'
  def name
  	"#{first_name} #{last_name}"
  end
end
