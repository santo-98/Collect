# frozen_string_literal: true

module ApiUtils
  def only_json_response
    request.format = 'json'
  end

  def page_not_found_json(message = I18n.t('api.v2.application.page_not_found'))
    render json: {
      message: message,
      status: 404,
      success: false
    }, status: 404
  end

  def internal_server_error_json
    render json: {
      status: 500,
      success: false
    }, status: 500
  end

  def error_json(message)
    render json: {
      message: message,
      status: 400,
      success: false
    }, status: 400
  end

  def success_json(message)
    render json: {
      message: message,
      status: 200,
      success: true
    }, status: 200
  end

  def okay_json
    render json: {
      status: 200,
      success: true
    }, status: 200
  end

  def unauthorized_json(message = I18n.t('api.v2.application.authorize.sign_in_required'))
    render json: {
      message: message,
      status: 401,
      success: false
    }, status: 401
  end

  def data_json(data)
    render json: data, status: 200
  end
end
