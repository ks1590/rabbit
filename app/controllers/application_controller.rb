class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :image, :image_cache, :remove_image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインしました。"      
    else
      flash[:notice] = "ようこそ、Rabbitへ。"       
    end
    root_url
  end

  def after_sitn_out_path_for(resource)
    new_user_session_path
  end
end