class CustomersController < ApplicationController
  before_action :set_form, :check_if_admin
  before_action :set_customer, only: [:destroy]

  def index
    @customers = @form.user_forms.where(role: :customer)
  end

  def new
  end

  def create
    @user = User.signup_with_email(params[:email])
    if User.exists?(@user.id)
      form = @form.user_forms.new(user_id: @user.id, role: :customer)
      if form.save
        redirect_to form_customers_path(@form), notice: "Invitation sent"
      else
        redirect_to form_customers_path(@form), notice: form.error_sentence
      end
    else
      redirect_to form_customers_path(@form), notice: @user.error_sentence
    end
  end

  def destroy
    if @customer.destroy
      redirect_to form_customers_path(@form)
    else
      redirect_to form_customers_path(@form), notice: @customer.error_sentence
    end
  end

  private
    def set_customer
      @customer = User.find_by(id: params[:id])
      redirect_to form_customers_path(@form), notice: "Unable to find user" unless @customer.present?
    end
end
