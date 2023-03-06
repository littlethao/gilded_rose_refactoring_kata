require 'item_delegator'

class AgedBrie < ItemDelegator
  def update_quality
    increase_quality_on(self) if self.quality < 50
  end
end