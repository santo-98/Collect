class ResponsesController < ApplicationController
  before_action :set_form
  before_action :check_if_admin, only: [:index]
  before_action :check_user_form, only: [:create]

  def index
    @responses = @form.questions.includes(:questionable)
    @response_headers = @form.questions.map { |question| question.questionable.title }
  end

  def create
    params[:question].each do |question_id, value|
      question = @form.questions.find_by(questionable_type: value[:questionable_type], questionable_id: value[:questionable_id])
      response = @form.responses.new(responsable: question.questionable, responder_id: current_user.id, response: value[:response])
      redirect_to root_path, notice: response.error_sentence unless response.save
    end
    redirect_to root_path, notice: "Thank you for your response"
  end
end
