class Survivor < ApplicationRecord
  # relationships
  has_many :resources, dependent: :destroy

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude

  # enum
  enum gender: [ :male, :female ]

  # queries
  scope :infected, -> { where(infected: true) }
  scope :uninfected, -> { where(infected: false) }
end
