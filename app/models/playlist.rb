class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_items
  has_many :readings, through: :playlist_items

  validates :title, presence: true

  def self.titles
    Playlist.all.map{ |playlist| playlist.title }
  end

  def books
    readings.map{|reading| reading.book}
  end
end
