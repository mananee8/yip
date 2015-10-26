class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @businesses = Business.all  
  end
end
