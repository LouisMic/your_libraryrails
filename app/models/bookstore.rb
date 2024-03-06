class Bookstore < ApplicationRecord
  validates :address, presence: true
end
