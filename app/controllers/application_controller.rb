class ApplicationController < ActionController::Base
  include ApiUtils
  protect_from_forgery with: :exception
end
