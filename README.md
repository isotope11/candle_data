# Candle Data

This is just a gem to assist in managing candlestick chart data in Ruby.  I couldn't find anything with a cursory glance, so I wrote one.

Make a new candle like this:

```ruby
candle = Candle.new(open_time, open, high, low, close, volume)
```

Update its data like this:

```ruby
candle.update(price, volume)
```
