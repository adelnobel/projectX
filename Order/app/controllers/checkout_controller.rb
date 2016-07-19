class CheckoutController < ApplicationController
	

	#items ids, quantities

  
	# POST /checkout
	def checkout!(requested_items,id) 
	
		available_items = validItems(requested_items) #ask Store
		prices =  totalPrice(available_items)#ask store

		canPurchase=checkBalance?(prices,id) 

		if canPurchase
			print_successfull_transaction(items)
			buy_item
			tems(items)#from store
		else
		 	print_failed_transaction()
		end
  	end

    # ----/----
	def print_successfull_transaction(items)
  	end

    def print_failed_transaction()
    end

	private
		def validItems
		 RestClient.post 'http://example.com/resource', {:params => {:items_id => :items_id, :id => :id}}
		end 

		def totalPrice
		 RestClient.post 'http://example.com/resource', {:params => {:items_id => :items_id, :id => :id}}
		end 

		def updateItems
		 RestClient.post 'http://example.com/resource', {:params => {:items_id => :items_id, :id => :id}}
		end 
end
