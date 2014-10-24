class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # check this out http://stackoverflow.com/questions/16258911/rails-4-authenticity-token
end
