class TopController < ApplicationController
  def index
    if user_signed_in?
      redirect_to trades_path
    end
  end
end