require_relative '../spec_helper'
require 'json'
require 'pry'

describe "Reading Mt. Gox Data" do
  let(:data) do
    raw_data = File.read(File.expand_path("../../files/history.json", __FILE__))
    JSON.parse(raw_data)
  end

  let(:mapped_data) do
    data["data"].map do |datum|
      {
        time: DateTime.strptime(datum["date"].to_s, '%s').to_time,
        price: BigDecimal.new(datum["price"]),
        amount: BigDecimal.new(datum["amount"])
      }
    end
  end

  it "can segment the data appropriately" do
    builder = CandleBuilder.new(mapped_data, candle_width: 1)
    expect(builder.candles.count).to eq(17526)
    builder = CandleBuilder.new(mapped_data, candle_width: 10)
    binding.pry
    expect(builder.candles.count).to eq(5537)
  end
end
