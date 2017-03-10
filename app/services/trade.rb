class Trade
  class << self
    def trade_resources(survivor_one, survivor_two, offer, wanted)
      if infected?(survivor_one, survivor_two)
        return "There are infected survivors."
      end

      if equal_points?(offer, wanted)
        if has_items?(survivor_one, offer) && has_items?(survivor_two, wanted)
          swap_items(survivor_one, survivor_two, offer, wanted)
        else
          return "Survivors does not have those items."
        end
      else
        return "Different amount of points between offer and wanted."
      end
    end

    private
      def infected?(survivor_one, survivor_two)
        survivor_one.infected || survivor_two.infected
      end

      def equal_points?(offer, wanted)
        return points(offer) == points(wanted)
      end

      def has_items?(survivor, items)
        survivor.inventory[:water] >= items[:water].to_i &&
        survivor.inventory[:food] >= items[:food].to_i &&
        survivor.inventory[:medication] >= items[:medication].to_i &&
        survivor.inventory[:ammunition] >= items[:ammunition].to_i
      end

      def swap_items(survivor_one, survivor_two, offer, wanted)
        increase_items(survivor_one, wanted)
        increase_items(survivor_two, offer)

        decrease_items(survivor_one, offer)
        decrease_items(survivor_two, wanted)

        survivor_one.save!
        survivor_two.save!

        return "Trade done."
      end

      def points(items)
        water = (items[:water].to_i * 4)
        food = (items[:food].to_i * 3)
        medication = (items[:medication].to_i * 2)
        ammunition = (items[:ammunition].to_i * 1)
        points = water + food + medication + ammunition
      end

      def increase_items(survivor, items)
        survivor.inventory[:water] += items[:water].to_i
        survivor.inventory[:food] += items[:food].to_i
        survivor.inventory[:medication] += items[:medication].to_i
        survivor.inventory[:ammunition] += items[:ammunition].to_i
      end

      def decrease_items(survivor, items)
        survivor.inventory[:water] -= items[:water].to_i
        survivor.inventory[:food] -= items[:food].to_i
        survivor.inventory[:medication] -= items[:medication].to_i
        survivor.inventory[:ammunition] -= items[:ammunition].to_i
      end
  end
end
