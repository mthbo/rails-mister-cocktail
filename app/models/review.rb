class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: [0,1,2,3,3,4,5], allow_nil: false }
end
