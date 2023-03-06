require 'delegate'
 
class ItemDelegator < SimpleDelegator
  def update
    return if self.name == "Sulfuras, Hand of Ragnaros"

    if self.name == "Aged Brie"
      if self.quality < 50
        increase_quality_on(self)
      end
    elsif self.name == "Backstage passes to a TAFKAL80ETC concert"
      if self.quality < 50
        increase_quality_on(self)
        if self.sell_in < 11
          increase_quality_on(self)
        end
        if self.sell_in < 6
          increase_quality_on(self)
        end
      end

      if self.sell_in < 0
        self.quality = self.quality - self.quality
      end
    else
      if self.quality > 0
        decrease_quality_on(self)
        if self.sell_in < 0 
          decrease_quality_on(self)
        end
      end
    end

    self.sell_in -= 1
  end

  private

  def decrease_quality_on(item)
    item.quality -= 1
  end

  def increase_quality_on(item)
    item.quality += 1
  end
end