class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  before_filter :set_search

  def set_search
    if params[:q].present? && params[:q]["found_time"].present?
      search_time = params[:q]["found_time"]
      params[:q]["found_time_gteq"] = (search_time.to_date-3).to_s
      params[:q]["found_time_lteq"] = (search_time.to_date+7).to_s
    end
    @q = Item.ransack(params[:q])
  end

  def login_required
    if current_user.blank?
      respond_to do |format|
        format.html {
          authenticate_user!
        }
        format.js {
          render :partial => "common/not_logined"
        }
        format.all {
          head(:unauthorized)
        }
      end
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name,:fb_id,:token]
    devise_parameter_sanitizer.for(:account_update) << [:name]
  end
end
