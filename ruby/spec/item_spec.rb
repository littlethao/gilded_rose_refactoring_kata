require 'item'

describe Item do
  let(:name) { "Item Name" }
  let(:sell_in_value) { 15 }
  let(:quality_value) { 10 }
  
  subject(:item) { described_class.new(name, sell_in_value, quality_value) }

  describe "#initialize" do
    it 'knows the name of an item' do
      expect(item.name).to eq(name)
    end

    it 'knows the SellIn value of an item' do
      expect(item.sell_in).to eq(sell_in_value)
    end

    it 'knows the Quality value of an item' do
      expect(item.quality).to eq(quality_value)
    end
  end

  describe "#to_s" do
    it 'returns the string representation of the item specifications' do
      expect(item.to_s).to eq("#{name}, #{sell_in_value}, #{quality_value}")
    end
  end
end