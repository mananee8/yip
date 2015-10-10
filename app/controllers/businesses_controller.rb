class BusinessesController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  
  def new
    @business = Business.new
    @user = @business.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business }
    end
  end
  
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        @business.user.add_role :business
        sign_in @business.user
        format.html { redirect_to dashboard_index_url, notice: 'Business signup successfully completed.' }
      else
        format.html { redirect_to business_signup_path, alert: @business.errors.full_messages.join("<br />").html_safe }
      end
    end
  end

  private
  def business_params    
    params.require(:business).permit(:name, :address, :phone, :location, :photo, :user_attributes => [:id, :email, :password, 
      :password_confirmation])
  end
end
