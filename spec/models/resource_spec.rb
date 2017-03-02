require 'rails_helper'

RSpec.describe Resource, type: :model do
  # Association test
  # ensure a resource belongs to a survivor
  it { should belong_to(:survivor) }

  # Validation test
  # ensure name is present
  it { should validate_presence_of(:name) }
end
