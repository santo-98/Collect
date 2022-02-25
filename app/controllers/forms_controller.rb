class FormsController < ApplicationController
  def index
    @forms = current_user.forms
  end

  def create
    @form = current_user.forms.new(form_params)
    if @form.save
      redirect_to forms_path
    else
      render 'new'
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
