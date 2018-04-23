class StocksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def search
    @stock = Stock.new_from_lookup("aapl")

    if params[:stock]
      @stock = Stock.find_by_ticker('FB')
     @stock ||= Stock.new_from_lookup(params[:stock])
      #this first checks the database
   end
  #
  #   if @stock
  #     render partials:'search'
  #   else
  #     render status: :not_found, nothing: true
  #   end
   end
end
