class Reading < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :playlist_items
  has_many :playlist, through: :playlist_items
  has_many :reviews

  scope :my_readings, ->(user) { where(user: user) }

  enum reading_status: {
    unread: 1,
    current: 2,
    paused: 3,
    finished: 4
  }

  def self.my_books(user)
    Reading.my_readings(user).map { |reading| reading.book }
  end
end
