class WelcomeController < ApplicationController
  
  def index
  	@items = Array[{'id' => 1, 'title' => "Makwa", 'price' => 30 , 'quantity' => 70},{'id' => 2,'title' => "Fera5", 'price' => 20 , 'quantity'=> 9}]
  end

  def signup
  end
  
  def login
  end
end
