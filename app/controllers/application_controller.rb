class ApplicationController < ActionController::Base
  include ApiUtils
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def set_current_user
    if current_user.present?
      @current_user = current_user
    end
  end

  def set_form
    @form = current_user.forms.find_by(id: params[:form_id])
  end

  def check_if_admin
    redirect_to root_path, notice: "You are not authorized to access this page" unless current_user.user_forms.find_by(
      form_id: @form.id
    ).admin?
  end
end
