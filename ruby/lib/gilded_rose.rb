require 'item_delegator'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      ItemDelegator.new(item).update
    end
  end
end
