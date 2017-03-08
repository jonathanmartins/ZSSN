class Survivor < ApplicationRecord
  serialize :inventory, Hash

  # validations
  validates_presence_of :name, :age, :gender, :latitude, :longitude, :inventory

  # enum
  enum gender: [ :male, :female ]

  class << self
    def infected
      return percentage(Survivor.where(infected: true).size)
    end

    def uninfected
      return percentage(Survivor.where(infected: false).size)
    end

    private

    def percentage(part)
      whole = Survivor.all.size
      return ((part.to_f / whole.to_f) * 100).round(3).to_s + "%"
    end
  end
end
