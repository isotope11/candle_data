require_relative './candle'

class CandleBuilder
  class CandleWidthNotSpecifiedError < StandardError; end

  attr_reader :candles
  def initialize(trades, options={})
    @trades = trades
    @candle_width = options.fetch(:candle_width) { raise CandleWidthNotSpecifiedError }
    @candles = []
    @last_time = nil
    extract_candles
  end

  private
  attr_reader :trades

  def extract_candles
    trades.each do |trade|
      extract_candle(trade)
    end
  end

  def extract_candle(trade)
    if in_current_candle(trade)
      add_to_current_candle(trade)
    else
      add_new_candle_for(trade)
      return true
    end
  end

  def in_current_candle(trade)
    return false unless last_candle
    return trade[:time] == last_candle.open_time
  end

  def add_new_candle_for(trade)
    open_time = trade[:time]
    open = close = high = low = trade[:price]
    volume = trade[:amount]
    candle = Candle.new(open_time, open, high, low, close, volume)
    @candles << candle
  end

  def add_to_current_candle(trade)
    last_candle.update(trade[:price], trade[:amount])
  end

  def last_candle
    @candles.last
  end
end
