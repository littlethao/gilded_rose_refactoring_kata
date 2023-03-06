require 'item_delegator'
require 'aged_brie'
require 'backstage_pass'
require 'sulfuras'
require 'conjured_item'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      ItemDelegator.lookup(item).update
    end
  end
end
