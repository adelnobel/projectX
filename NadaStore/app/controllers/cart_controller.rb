class CartController < ApplicationController
  def add
  	payload = params['item_tosend']
  	# puts "payload" , payload , "."  
    payload_json = payload.to_json
    puts "payload", payload["id"]
    str = ApplicationController::CART_URL + session[:user_id].to_s + '/' + payload[:id].to_s + '/' + payload[:quantity].to_s + '/'
  	res_json = RestClient.put str, :content_type => 'application/json'	
  end

  def remove
  end

  def update
  	######
  end

  def index
  	str = ApplicationController::CART_URL + session[:user_id].to_s 
    puts 'str' , str
  	res_json = RestClient.get str, :content_type => 'application/json'
  	puts res_json
  	@items = JSON.parse (res_json)
  end
end
