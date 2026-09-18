require './weight.rb'

RSpec.describe Weight do
  describe "#get_average" do
    it "returns the average of an array" do
      weight = Weight.new
      expect(weight.get_average([1, 2])).to eql(1.5)
    end
  end

  describe "#convert_weight_to_lbs" do
    it "returns the values of array from kg to lbs" do
      weight = Weight.new
      expect(weight.convert_weight_to_lbs([10, 20])).to eql([22.05, 44.1])
    end
  end
end
