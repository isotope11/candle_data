require 'spec_helper'

describe Candle do
  let(:open_time) { Time.parse("2013-04-26T12:53:41-05:00") }
  let(:open) { BigDecimal('100') }
  let(:high) { BigDecimal('100') }
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
end
