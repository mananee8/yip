class CustomersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new]

  def new
    @customer = Customer.new
    @user = @customer.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end
  
  private
  def customer_params    
    params.require(:customer).permit(:name, :username, :dob, :location, :user_attributes => [:id, :email, :password, 
      :password_confirmation])
  end
end
