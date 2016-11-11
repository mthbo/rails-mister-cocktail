class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_attachment :photo

  validates :name, presence: { message: "The cocktail must have a name" }
  validates :name, uniqueness: { message: "The cocktail already exists" }
end
