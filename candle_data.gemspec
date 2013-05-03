# -*- encoding: utf-8 -*-
require File.expand_path('../lib/candle_data/version', __FILE__)
Gem::Specification.new do |gem|
  gem.authors = ["Josh Adams"]
  gem.email = ["josh@isotope11.com"]
  gem.description = %q{A class for handling candlestick chart data}
  gem.summary = %q{A class for handling candlestick chart data}
  gem.homepage = "http://www.isotope11.com"
  gem.name = "candle_data"
  gem.version = CandleData::VERSION
  gem.add_development_dependency 'rspec'

  gem.files = %w(lib/candledata.rb lib/candle_data/candle.rb lib/candle_data/candle_builder.rb lib/candle_data/version.rb)
  gem.require_paths = ["lib"]
end
