class BusinessesController < ApplicationController
  before_filter :authenticate_user!, :except => [:new]
  
  def new
    @business = Business.new
    @user = @business.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business }
    end
  end

  private
  def business_params    
    params.require(:business).permit(:name, :address, :phone, :location, :photo, :user_attributes => [:id, :email, :password, 
      :password_confirmation])
  end
end
