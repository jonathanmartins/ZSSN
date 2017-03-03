require 'rails_helper'

RSpec.describe Survivor, type: :model do
  # Validation test
  # ensure name, age, gender, latitude and longitude is present
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:inventory) }
end
