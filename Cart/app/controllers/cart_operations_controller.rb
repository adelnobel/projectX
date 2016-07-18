class CartOperationsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def remove_item
  	require 'json'
  	response = {}
  	if params.has_key?(:user_id) && params.has_key?(:item_id)
  		UserItem.where({:user_id => params[:user_id], :item_id => params[:item_id]}).destroy_all
  		response[:response] = 'Success'
  	else 
  		response[:error] = 'Malformed request'
  	end
  	render :json => response.to_json
  end

  def update_item
	  require 'json'
  	response = {}
  	if params.has_key?(:user_id) && params.has_key?(:item_id) && params.has_key?(:quantity)
  		user_item = UserItem.find_or_create_by!({:user_id => params[:user_id], :item_id => params[:item_id]})
  		user_item.quantity = params[:quantity].to_i
  		user_item.save!
  		response[:response] = 'Success'
  	else 
  		response[:error] = 'Malformed request'
  	end
  	render :json => response.to_json
  end

  def get_cart
	  require 'json'
  	response = {}
  	if params.has_key?(:user_id)
  		user_items = UserItem.select('item_id, quantity').where({:user_id => params[:user_id]}).all
  		response = user_items
  	else 
  		response[:error] = 'Malformed request'
  	end
  	render :json => response.to_json(only: [:item_id, :quantity, :error])
  end

  def empty_cart
  	require 'json'
  	response = {}
  	if params.has_key?(:user_id)
  		UserItem.where(:user_id => params[:user_id]).destroy_all
  		response[:response] = 'Success'
  	else 
  		response[:error] = 'Malformed request'
  	end
  	render :json => response.to_json
  end

end
