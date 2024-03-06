class Suggestion < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :sender
end
