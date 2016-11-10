class Ingredient < ApplicationRecord
  has_many :doses, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true

  scope :ordered, -> { all.sort_by { |ingredient| ingredient.name.downcase } }
end
