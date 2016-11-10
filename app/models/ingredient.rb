class Ingredient < ApplicationRecord
  has_many :doses, dependent: :destroy, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
