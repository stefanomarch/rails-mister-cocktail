class Ingredient < ApplicationRecord
  INGREDIENTS = self.all.map{|i| i.name}
  has_many :cocktails, through: :doses
  has_many :doses
  validates :name, presence: true, uniqueness: true
end
