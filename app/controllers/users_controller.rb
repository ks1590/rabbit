class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payment, only: [:edit, :update, :destroy]

  PREVIEW = 15

  def show
    @user = current_user
    @trades = Trade.list_default(current_user)
    @trades = @trades.page(params[:page]).per(PREVIEW)
    redirect_to trades_path if @user.id != params[:id].to_i
  end

  def edit
  end
  
  def setting
    @payments = Payment.all
    @categories = Category.all
    
  end

  private
  def set_payment
    @payment = Payment.find(params[:id])
  end
  
end