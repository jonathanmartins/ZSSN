class Survivor < ApplicationRecord
  before_save :points
  serialize :inventory, Hash

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude, :inventory

  # enum
  enum gender: [ :male, :female ]

  class << self
    def infected_survivors
      percentage(infecteds.size)
    end

    def uninfected_survivors
      percentage(uninfecteds.size)
    end

    def points_lost
      points_lost = infecteds.sum(:points)
      return "#{points_lost} points lost due to #{infecteds.size} infected survivors."
    end

    def average_resources
      return "Todo"
    end

    private
      def percentage(part)
        whole = Survivor.all.size
        return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
      end

      def infecteds
        where(infected: true)
      end

      def uninfecteds
        where(infected: false)
      end
  end

  private
    def points
      water, food, med, ammo = self.inventory.values_at(:water, :food, :medication, :ammunition)
      self.points = (water.to_i * 4) + (food.to_i * 3) + (med.to_i * 2) + (ammo.to_i * 1)
    end
end
