class ItemController < ApplicationController
  
  def index
    @is_user_signed = session['user_id'].present?
    res_json = RestClient.get STORE_URL + 'items/' + params["item_id"] , :content_type => 'application/json'
    @item = JSON.parse(res_json)

    res_json = RestClient.get REVIEW_URL + params["item_id"] , :content_type => 'application/json'
    @reviews = JSON.parse(res_json)

  end

  def submit_review
    @is_user_signed = session['user_id'].present?
    if @is_user_signed
      request_uri = REVIEW_URL + params['item_id'] + '/' + session['user_id'].to_s + '/' \
        + params['review']['rating'] + '/' + params['review']['body']

      RestClient.post URI.escape(request_uri) , :content_type => 'application/json'
    end

    redirect_to item_index_path(params['item_id'])
  end

  def add
  	filldb = Array[{'title' => "Makwa", 'price' => 30 , 'quantity' => 70},{'title' => "Fera5", 'price' => 20 , 'quantity'=> 9},
  				{'title' => "Cream", 'price' => 6 , 'quantity' => 100},{'title' => "batee5", 'price' => 55 , 'quantity'=> 2},
  				{'title' => "Shagara", 'price' => 4 , 'quantity' => 88},{'title' => "Wezza", 'price' => 35 , 'quantity'=> 4}]
  	# @items = Array[{'id'=> 1, 'title' => "Makwa", 'price' => 30 , 'quantity' => 70},{'id' => 2,'title' => "Fera5", 'price' => 20 , 'quantity'=> 9}]
  	filldb.each do |item|
    	payload_json = item.to_json   
    	puts payload_json
  		res_json = RestClient.post 'http://localhost:3050/items', payload_json, :content_type => 'application/json'
    	res = JSON.parse(res_json)
    	puts "res", res
    end
    redirect_to welcome_index_path
  end
end
