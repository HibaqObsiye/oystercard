require 'station'

describe Station do
let(:station) {Station.new("bow",1)}

it "Should accept name" do
  expect(station.name).to eq("bow")
end

it "should accept zone" do
  expect(station.zone).to eq(1)

end



end