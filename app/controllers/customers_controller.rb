class CustomersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]

  def new
    @customer = Customer.new
    @user = @customer.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end
  
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        @customer.user.add_role :customer
        sign_in @customer.user
        format.html { redirect_to dashboard_index_url, notice: 'Customer signup successfully completed.' }
      else
        format.html { redirect_to customer_signup_path, alert: @customer.errors.full_messages.join("<br />").html_safe }
      end
    end
  end
  
  private
  def customer_params    
    params.require(:customer).permit(:name, :username, :dob, :location, :user_attributes => [:id, :email, :password, 
      :password_confirmation])
  end
end
