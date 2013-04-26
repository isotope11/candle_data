module CandleData
  class Candle
    attr_reader :open_time, :open, :high, :low, :close, :volume

    def initialize(open_time, open, high, low, close, volume)
      @open_time = open_time
      @open = open
      @high = high
      @low = low
      @close = close
      @volume = volume
    end

    def update(price, volume)
      @close = price
      @volume += volume
    end
  end
end
