class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'home'
  
  def index
  end
end
