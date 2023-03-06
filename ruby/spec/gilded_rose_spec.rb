require 'item_delegator'
require 'gilded_rose'
require 'item'

describe GildedRose do
  describe "#update_quality" do
    it "degrades by 1 SellIn value and 1 quality value each day" do
      items = [Item.new("Nutella", 5, 10)]
      GildedRose.new(items).update_quality

      expect(items[0].sell_in).to eq(4)
      expect(items[0].quality).to eq(9)
    end

    it "degrades double in quality value when SellIn value < 0" do
      items = [Item.new("Nutella", -1, 20)]
      GildedRose.new(items).update_quality

      expect(items[0].sell_in).to eq(-2)
      expect(items[0].quality).to eq(18)
    end

    it "does not decrease quality value lower than 0" do
      items = [Item.new("Nutella", 10, 0)]
      GildedRose.new(items).update_quality

      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(0)
    end

    it "does not increase quality value exceeding 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality

      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(50)
    end
    
    context "Aged Brie" do
      it "increases in quality when decreasing in SellIn value" do
        items = [Item.new("Aged Brie", 20, 10)]
        GildedRose.new(items).update_quality

        expect(items[0].sell_in).to eq(19)
        expect(items[0].quality).to eq(11)
      end
    end

    context "Sulfuras, Hand of Ragnaros" do
      it "the quality value is always 80" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq(80)
      end

      it "does not degrade in sell in value" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
        GildedRose.new(items).update_quality

        expect(items[0].sell_in).to eq(10)
      end
    end

    context "Backstage passes to a TAFKAL80ETC concert" do
      context "when the SellIn value is larger than 10" do
        it "decreases by 1 SellIn value and by 1 Quality value" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 30, 10)]
          GildedRose.new(items).update_quality

          expect(items[0].sell_in).to eq(29)
          expect(items[0].quality).to eq(11)
        end
      end

      context "when the SellIn value is 6-10" do
        it "decreases by 1 SellIn value and increases by 2 Quality value" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
          GildedRose.new(items).update_quality

          expect(items[0].sell_in).to eq(9)
          expect(items[0].quality).to eq(12)
        end
      end

      context "when the SellIn value is 0 to 5" do
        it "decreases by 1 SellIn value and increases by 3 Quality value" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
          GildedRose.new(items).update_quality

          expect(items[0].sell_in).to eq(4)
          expect(items[0].quality).to eq(13)
        end
      end

      context "when the SellIn value has passed 0" do
        it "decreases by 1 SellIn value and drops to 0 Quality value" do
          items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 10)]
          GildedRose.new(items).update_quality

          expect(items[0].sell_in).to eq(-2)
          expect(items[0].quality).to eq(0)
        end
      end
    end

    context "Conjured Mana Cake" do
      it "degrades double in quality value each day" do
        items = [Item.new("Conjured Mana Cake", 15, 20)]
        GildedRose.new(items).update_quality

        expect(items[0].quality).to eq(18)
      end
    end
  end
end
