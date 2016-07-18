class ApiController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  API_URL = "http://localhost:3040/"

  def remove_item
    response = {}
    UserItem.where({:user_id => params[:user_id], :item_id => params[:item_id]}).destroy_all
    response[:response] = 'Success'
    render :json => response.to_json
  end

  def update_item
    response = {}
    user_item = UserItem.find_or_create_by!({:user_id => params[:user_id], :item_id => params[:item_id]})
    user_item.quantity = params[:quantity].to_i
    user_item.save!
    response[:response] = 'Success'
    render :json => response.to_json
  end

  def get_cart
    response = {}
    user_items = UserItem.select('item_id, quantity').where({:user_id => params[:user_id]}).all
    response = user_items
    render :json => response.to_json(only: [:item_id, :quantity, :error])
  end

  def empty_cart
    response = {}
    UserItem.where(:user_id => params[:user_id]).destroy_all
    response[:response] = 'Success'
    render :json => response.to_json
  end

end
