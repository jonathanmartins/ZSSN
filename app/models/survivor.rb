class Survivor < ApplicationRecord
  before_save :points
  serialize :inventory, Hash

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude, :inventory

  # enum
  enum gender: [ :male, :female ]

  class << self
    def infected_survivors
      return percentage(Survivor.where(infected: true).size)
    end

    def uninfected_survivors
      return percentage(Survivor.where(infected: false).size)
    end

    private
      def percentage(part)
        whole = Survivor.all.size
        return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
      end
  end

  private
    def points
      water, food, medication, ammunition = self.inventory.values_at(:water, :food, :medication, :ammunition)
      self.points = (water.to_i * 4) + (food.to_i * 3) + (medication.to_i * 2) + (ammunition.to_i * 1)
    end
end
