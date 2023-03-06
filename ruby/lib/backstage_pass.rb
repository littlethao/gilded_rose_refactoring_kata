require 'item_delegator'

class BackstagePass < ItemDelegator
  def update_quality
    if self.sell_in < 0
      self.quality = 0
    elsif self.quality < 50
      increase_quality_on(self)

      if self.sell_in < 11
        increase_quality_on(self)
      end
      
      if self.sell_in < 6
        increase_quality_on(self)
      end
    end
  end
end