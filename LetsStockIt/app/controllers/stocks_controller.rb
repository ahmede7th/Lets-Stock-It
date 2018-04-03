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
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
      #this first checks the database
    end

    if @stock
      render partial:'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end
