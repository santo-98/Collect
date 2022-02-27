class ResponsesController < ApplicationController
  before_action :set_form
  before_action :check_if_admin, only: [:index]
  before_action :check_user_form, :check_user_already_responded, only: [:create]

  def index
    @responses = @form.responses.includes(:responsable).group_by(&:responder_id)
    @response_headers = @form.questions.map { |question| question.questionable.title }
  end

  def create
    params[:question].each do |question_id, value|
      question = @form.questions.find_by(questionable_type: value[:questionable_type], questionable_id: value[:questionable_id])
      response = @form.responses.new(responsable: question.questionable, responder_id: current_user.id, response: value[:response])
      response.save
    end
    redirect_to root_path, notice: "Thank you for your response"
  end

  private
    def check_user_already_responded
      redirect_to root_path, notice: "Form has been already submitted" if current_user.responses.where(form_id: @form.id).any?
    end
end
