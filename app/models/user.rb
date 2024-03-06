class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :playlists
  has_many :playlist_items, through: :playlists
  has_many :readings, through: :playlist_items
  has_many :reviews
  has_many :suggestions
end
