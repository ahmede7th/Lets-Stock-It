class UsersController < ApplicationController
def profile
  @user = current_user
  @user_stocks = current_user.stocks
end

end
