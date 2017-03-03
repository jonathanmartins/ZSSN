class Resource < ApplicationRecord
  # relationship
  belongs_to :survivor

  # validations
  validates_presence_of :name, :quantity
end
