class Employee
  include Mongoid::Document
  field :name, type: String
  field :hourly_wage, type: Float
  field :address, type: String
end
