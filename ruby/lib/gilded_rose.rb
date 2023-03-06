class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      return if item.name == "Sulfuras, Hand of Ragnaros"

      if item.name == "Aged Brie"
        if item.quality < 50
          increase_quality_on(item)
        end
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          increase_quality_on(item)
          if item.sell_in < 11
            increase_quality_on(item)
          end
          if item.sell_in < 6
            increase_quality_on(item)
          end
        end

        if item.sell_in < 0
          item.quality = item.quality - item.quality
        end
      else
        if item.quality > 0
          decrease_quality_on(item)
          if item.sell_in < 0 
            decrease_quality_on(item)
          end
        end
      end

      item.sell_in -= 1
    end
  end

  private

  def decrease_quality_on(item)
    item.quality -= 1
  end

  def increase_quality_on(item)
    item.quality += 1
  end
end
