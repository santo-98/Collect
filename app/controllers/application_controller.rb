class ApplicationController < ActionController::Base
  include ApiUtils
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def set_current_user
    if current_user.present?
      @current_user = current_user
    end
  end
end
