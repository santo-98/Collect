class QuestionsController < ApplicationController
  before_action :set_form, :check_if_admin
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
      redirect_to new_form_question_path(form_id: @form.id), notice: @question.error_sentence
    end
  end

  private
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
        options: params[:options]
      }.compact
    end
end
