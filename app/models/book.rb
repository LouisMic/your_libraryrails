class Book < ApplicationRecord
  has_many :readings
  has_many :suggestions

  validates :title, presence: true

  def self.unread_books(user)
    Book.all.reject{|book| Reading.my_books(user).include?(book)}
  end
end
