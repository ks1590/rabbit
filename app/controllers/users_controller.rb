class UsersController < ApplicationController
  before_action :authenticate_user!
  PREVIEW = 15

  def show
    @user = current_user
    @trades = Trade.list_default(current_user)
    @trades = @trades.page(params[:page]).per(PREVIEW)
    redirect_to trades_path if @user.id != params[:id].to_i
  end
end