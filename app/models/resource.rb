class Resource < ApplicationRecord
  # relationship
  belongs_to :survivor

  # validation
  validates_presence_of :name
end
