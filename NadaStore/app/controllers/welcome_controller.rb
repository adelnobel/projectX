class WelcomeController < ApplicationController
  
  def index
  	filldb = Array[{'title' => "Makwa", 'price' => 30 , 'quantity' => 70},{'title' => "Fera5", 'price' => 20 , 'quantity'=> 9}]
  	# @items = Array[{'id'=> 1, 'title' => "Makwa", 'price' => 30 , 'quantity' => 70},{'id' => 2,'title' => "Fera5", 'price' => 20 , 'quantity'=> 9}]
  	#  filldb.each do |item|
   #    	payload_json = item.to_json   
   #    	puts payload_json
  	#  	res_json = RestClient.post 'http://localhost:3050/items', payload_json, :content_type => 'application/json'
   #    	res = JSON.parse(res_json)
   #    	puts "res", res
   #    end
    items_json = RestClient.get STORE_URL + 'items' , :content_type => 'application/json'
	  @items = JSON.parse(items_json)
    puts "items", @items
  end

  def signup
  end
  
  def login
  end
end
