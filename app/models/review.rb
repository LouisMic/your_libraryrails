class Review < ApplicationRecord
  belongs_to :reading
  belongs_to :user
end
