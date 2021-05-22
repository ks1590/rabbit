class UsersController < ApplicationController
  def show
    @user = current_user
    @trades = Trade.joins(:payment).joins(:category)
  end
end