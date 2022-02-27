class FormsController < ApplicationController
  before_action :set_form, :check_user_form, only: [:show]

  def index
    @forms = current_user.forms
  end

  def show
    @questions = @form.questions
  end

  def create
    @form = current_user.forms.new(form_params)
    if @form.save
      redirect_to forms_path
    else
      redirect_to new_form_path, notice: @form.error_sentence
    end
  end

  def new
    @form = Form.new
  end

  private
    def form_params
      {
        title: params[:form][:title]
      }.compact
    end
end
