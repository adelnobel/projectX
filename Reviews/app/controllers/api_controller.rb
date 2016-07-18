class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def add_review
    require 'json'
    response = {}
    if [:user_id, :item_id, :rating, :body].all? {|s| params.has_key? s} 
      user_item = Review.find_or_create_by!({:user_id => params[:user_id], :item_id => params[:item_id]})
      user_item.rating = params[:rating].to_i
      user_item.body = params[:body]
      user_item.save!
      response[:response] = 'Success'
    else 
      response[:error] = 'Malformed request'
    end
    render :json => response.to_json
  end

  def get_reviews
    require 'json'
    response = {}
    if params.has_key? :item_id
      reviews = Review.where({:item_id => params[:item_id]}).all
      response = reviews
    else 
      response[:error] = 'Malformed request'
    end
    render :json => response.to_json(only: [:item_id, :user_id, :rating, :body, :error])
  end

end
