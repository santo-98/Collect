class CustomersController < ApplicationController
  before_action :set_form, :check_if_admin
  before_action :set_customer, only: [:destroy]

  def index
    @customers = @form.user_forms.where(role: :customer, verified: true)
  end

  def new
  end

  def create
    @user = User.signup_with_email(customer_params)
    # To be refactored
    if User.exists?(@user.id)
      form = @form.user_forms.new(user_id: @user.id, role: :customer)
      if form.save
        TwilioTextMessenger.new(edit_user_password_url(reset_token: @user.reset_password_token), @user.phone_number).call
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

    def customer_params
      {
        email: params[:email],
        phone_number: params[:phone_number]
      }.compact
    end
end
