require_relative '../spec_helper'

describe Candle do
  let(:open_time) { Time.parse("2013-04-26T12:53:41-05:00") }
  let(:open) { BigDecimal('100') }
  let(:high) { BigDecimal('101.12345') }
  let(:low) { BigDecimal('100') }
  let(:close) { BigDecimal('100') }
  let(:volume) { BigDecimal('100') }

  it "can be initialized" do
    expect { Candle.new(open_time, open, high, low, close, volume) }.to_not raise_error
  end

  it "can be updated" do
    candle = Candle.new(open_time, open, high, low, close, volume)
    new_price = BigDecimal('110')
    new_volume = BigDecimal('2')
    candle.update(new_price, new_volume)
    expect(candle.close).to eq(new_price)
    expect(candle.volume).to eq(volume + new_volume)
  end

  it "has its low updated" do
    candle = Candle.new(open_time, open, high, low, close, volume)
    new_price = BigDecimal('10')
    new_volume = BigDecimal('1')
    candle.update(new_price, new_volume)
    expect(candle.low).to eq(new_price)
  end

  it "has its high updated" do
    candle = Candle.new(open_time, open, high, low, close, volume)
    new_price = BigDecimal('111')
    new_volume = BigDecimal('1')
    candle.update(new_price, new_volume)
    expect(candle.high).to eq(new_price)
  end

  it "can output to_h" do
    candle = Candle.new(open_time, open, high, low, close, volume)
    expect(candle.to_h).to eq({
      open_time: "2013-04-26T12:53:41-05:00",
      open: "100.0",
      high: "101.12345",
      low: "100.0",
      close: "100.0",
      volume: "100.0"
    })
  end
end
