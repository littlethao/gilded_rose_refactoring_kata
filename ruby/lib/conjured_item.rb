require 'item_delegator'

class ConjuredItem < ItemDelegator
  def update_quality
    2.times { decrease_quality_on(self) }
  end
end