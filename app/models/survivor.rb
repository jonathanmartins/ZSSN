class Survivor < ApplicationRecord
  # relationships
  has_many :resources, dependent: :destroy

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude

  # enum
  enum gender: [ :male, :female ]
end
