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
      @low   = price if price < @low
      @high  = price if price > @high
      @volume += volume
    end

    def to_h
      {
        open_time: open_time.iso8601,
        open: open.to_s('F'),
        high: high.to_s('F'),
        low: low.to_s('F'),
        close: close.to_s('F'),
        volume: volume.to_s('F')
      }
    end
  end
end
