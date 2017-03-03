class Survivor < ApplicationRecord
  serialize :inventory, Hash

  attr_readonly :inventory

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude, :inventory

  # enum
  enum gender: [ :male, :female ]

  # queries
  scope :infected, -> { where(infected: true) }
  scope :uninfected, -> { where(infected: false) }
end
