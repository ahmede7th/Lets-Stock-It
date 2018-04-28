class StocksController < ApplicationController
  def index
  end

  def show
  end

  def new
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
  @user_stock = UserStock.create(user: current_user, stock: stock)
  flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
  redirect_to my_portfolio_path
  end

  def edit
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Stock successfully removed from portfolio"
    redirect_to my_portfolio_path
  end

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
  #
  #   if @stock
  #     render partials:'search'
  #   else
  #     render status: :not_found, nothing: true
  #   end
   end
end
