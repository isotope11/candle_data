require_relative '../spec_helper'

describe CandleBuilder do
  let(:start_time) { Time.parse("2013-04-26T12:53:41-05:00") }
  let(:trades){
    [
      new_trade(start_time, "151.611", "6"),
      new_trade(start_time + 1, "151.000", "1"),
      new_trade(start_time + 1, "152.000", "1"),
      new_trade(start_time + 2, "150", "1")
    ]
  }
  subject{ CandleBuilder.new(trades, candle_width: 1) }

  # TODO: Handle it being passed a stream
  it 'builds a series of candles from an array of data' do
    expect(subject.candles.count).to eq(3)
  end

  it 'builds the candles correctly' do
    first_candle  = subject.candles[0]
    second_candle = subject.candles[1]
    third_candle  = subject.candles[2]

    expect(first_candle.close).to eq(BigDecimal("151.611"))
    expect(first_candle.volume).to eq(BigDecimal("6"))

    expect(second_candle.close).to eq(BigDecimal("152.000"))
    expect(second_candle.volume).to eq(BigDecimal("2"))

    expect(third_candle.close).to eq(BigDecimal("150"))
    expect(third_candle.volume).to eq(BigDecimal("1"))
  end

  it 'can have the candle_width specified' do
    builder = CandleBuilder.new(trades, candle_width: 2)
    expect(builder.candles.count).to eq(2)
    first_candle  = builder.candles[0]
    expect(first_candle.close).to eq(BigDecimal("152.000"))
    expect(first_candle.volume).to eq(BigDecimal("8"))
  end

  # Just a factory for making trades easy in tests
  def new_trade(time, price, amount)
    { time: time, price: BigDecimal.new(price), amount: BigDecimal.new(amount) }
  end
end
