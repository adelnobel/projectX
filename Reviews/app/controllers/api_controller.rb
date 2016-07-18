class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def add_review
    response = {}
    user_item = Review.find_or_create_by!({:user_id => params[:user_id], :item_id => params[:item_id]})
    user_item.rating = params[:rating].to_i
    user_item.body = params[:body]
    user_item.save!
    response[:response] = 'Success'
    render :json => response.to_json
  end

  def get_reviews
    response = {}
    reviews = Review.where({:item_id => params[:item_id]}).all
    response = reviews
    render :json => response.to_json(only: [:item_id, :user_id, :rating, :body, :error])
  end

end
