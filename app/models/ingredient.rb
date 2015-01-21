class Ingredient
  include Mongoid::Document
  field :name, type: String
  field :quantity, type: Float
  field :units, type: String
  field :price_per_unit, type: Float

  validates :name, presence: true, uniqueness: { case_sensitive: false}
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :units, presence: true
  validates :price_per_unit, presence: true
end

