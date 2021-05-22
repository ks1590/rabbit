class UsersController < ApplicationController
  PREVIEW = 15

  def show
    @user = current_user
    @trades = Trade.joins(:payment).joins(:category).default
    @trades = @trades.page(params[:page]).per(PREVIEW)    
  end
end