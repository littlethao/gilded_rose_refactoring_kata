require 'delegate'
 
class ItemDelegator < SimpleDelegator
  def self.lookup(item)
    if item.name == "Aged Brie"
      AgedBrie.new(item)
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      BackstagePass.new(item)
    elsif item.name == "Sulfuras, Hand of Ragnaros"
      Sulfuras.new(item)
    elsif item.name == "Conjured Mana Cake"
      ConjuredItem.new(item)
    else
      new(item)
    end
  end

  def update
    return if self.name == "Sulfuras, Hand of Ragnaros"
      
    update_quality
    decrease_sell_in_value_on(self)
  end

  private

  def update_quality
    if self.quality > 0
      decrease_quality_on(self)
      if self.sell_in < 0 
        decrease_quality_on(self)
      end
    end
  end

  def decrease_quality_on(item)
    item.quality -= 1
  end

  def increase_quality_on(item)
    item.quality += 1
  end

  def decrease_sell_in_value_on(item)
    item.sell_in -= 1
  end
end