class ItemController < ApplicationController
  
  def index
    res_json = RestClient.get STORE_URL + 'items/' + params["item_id"] , :content_type => 'application/json'
    @item = JSON.parse(res_json)

    res_json = RestClient.get REVIEW_URL + params["item_id"] , :content_type => 'application/json'
    @reviews = JSON.parse(res_json)

  end

  def submit_review
    request_uri = REVIEW_URL + params['item_id'] + '/' + session['user_id'].to_s + '/' \
      + params['review']['rating'] + '/' + params['review']['body']

    RestClient.post URI.escape(request_uri) , :content_type => 'application/json'
    redirect_to item_index_path(params['item_id'])
  end

end
