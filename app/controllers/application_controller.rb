class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

   def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@guest'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  def set_search
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result
  end

  protected

  def after_sign_in_path_for(resource)
    recipes_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
