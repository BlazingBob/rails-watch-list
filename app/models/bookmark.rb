class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, uniqueness: { scope: :list, message: 'You have already added this movie' }
  validates :comment, length: { minimum: 6 }
end
