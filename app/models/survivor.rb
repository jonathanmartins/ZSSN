class Survivor < ApplicationRecord
  # relationships
  has_many :resources

  # validations

  # enum
  enum gender: [ :male, :female ]
end
