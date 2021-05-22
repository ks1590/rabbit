class UsersController < ApplicationController
  PREVIEW = 15

  def show
    @user = current_user
    @trades = Trade.default.where(user_id: current_user.id)
    @trades = @trades.page(params[:page]).per(PREVIEW)
    redirect_to trades_path if @user.id != params[:id].to_i
  end
end