class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      return if item.name == "Sulfuras, Hand of Ragnaros"

      item.sell_in -= 1

      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          decrease_quality_on(item)
        end
      else
        if item.quality < 50
          increase_quality_on(item)
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                increase_quality_on(item)
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                increase_quality_on(item)
              end
            end
          end
        end
      end

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              decrease_quality_on(item)
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            increase_quality_on(item)
          end
        end
      end
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
