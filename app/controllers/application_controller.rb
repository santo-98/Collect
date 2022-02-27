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
    @form = current_user.user_forms.find_by(form_id: (params[:form_id] || params[:id]) ).form
  end

  def check_if_admin
    redirect_to root_path, notice: "You are not authorized to access this page" unless current_user.user_forms.find_by(
      form_id: @form.id
    ).admin?
  end

  def check_user_form
    redirect_to root_path, notice: "You are not authorized to access this page" unless @form.present? && @form.user_forms.find_by(
      user_id: current_user.id
    ).present?
  end
end
