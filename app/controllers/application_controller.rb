class ApplicationController < ActionController::Base
  include Pundit
  
  after_action :verify_authorized, {:only => [:groups]}
  before_action :show?, {:only => [:groups]}
  skip_forgery_protection
end
