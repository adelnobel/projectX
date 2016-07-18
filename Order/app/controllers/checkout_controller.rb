class CheckoutController < ApplicationController
	
  
	# POST /checkout
	def checkout!(items_id,id) 
	
		items = validItems(items_id) #ask Store
		prices =  totalPrice(items_id)#ask store

		canPurchase=checkBalance?(prices,id) 

		if canPurchase
			print_successfull_transaction(items)
			updateItems(items)#from store
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
