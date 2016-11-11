class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :ingredient, presence: { message: "Select an ingredient"}
  validates :description, presence: { message: "Describe the recipe"}
  validates :ingredient, uniqueness: { scope: :cocktail, message: "The cocktail already has this ingredient" }

end
