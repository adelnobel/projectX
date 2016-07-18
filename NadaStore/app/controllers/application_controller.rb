class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  NADASTORE_URL = 'http://localhost:3000/' 
  AUTHENTICATION_URL = 'http://localhost:3030/'
  CART_URL = 'http://localhost:3040/'
  STORE_URL = 'http://localhost:3050/'
  REVIEW_URL = 'http://localhost:3060/'
  
end
