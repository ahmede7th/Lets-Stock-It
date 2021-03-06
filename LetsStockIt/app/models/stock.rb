class Stock < ApplicationRecord

def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
end



def self.new_from_lookup(ticker_symbol)

   looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
   return looked_up_stock
   # return nil unless looked_up_stock
   #
   # new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock)
   # tester= looked_up_stock.quote
   # new_stock.last_price = new_stock.price()
   #
   # new_stock
end



def price

 closing_price = StockQuote::Stock.quote(ticker).close

 return "#{closing_price} (Closing)" if closing_price

 opening_price = StockQuote::Stock.quote(ticker).open

 return "#{opening_price} (Opening)" if opening_price

 'Unavailable'

end
end

#self - added because method is not tied to an object
