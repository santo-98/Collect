class QuestionsController < ApplicationController
  before_action :set_form
  before_action :create_question, only: [:create]
  before_action :set_question, only: [:destroy]

  def index
    @questions = @form.questions
  end
  
  def create
    @question = @form.questions.new(questionable: @question, user_id: current_user.id)

    if @question.save
      redirect_to form_questions_path(@form)
    else
      redirect_to new_form_question_path(form_id: @form.id), notice: @question.error_sentence
    end
  end

  def new
    @question = @form.questions.new
  end

  def destroy
    if @question.destroy
      redirect_to form_questions_path(@form)
    else
      render 'index'
    end
  end

  private
    def set_form
      @form = current_user.forms.find_by(id: params[:form_id])
    end

    def set_question
      @question = @form.questions.find_by(id: params[:id])
    end

    def create_question
      @question = params[:question_type].constantize.new(question_params)
      redirect_to new_form_question_path(form_id: @form.id), notice: @question.error_sentence unless @question.save
    end

    def question_params
      {
        title: params[:title],
        description: params[:description],
        mandatory: params[:mandatory_question],
        options: params[:options],
        responder_id: current_user.id
      }.compact
    end
end
