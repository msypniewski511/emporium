class Admin::Publisher < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 2..255}
end
