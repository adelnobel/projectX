class UserController < ApplicationController 
  
  def create 
    payload = {:username => params[:user][:username].to_s, :password => encrypt_password( params[:user][:password].to_s),
                :firstname => params[:user][:firstname].to_s, :email => params[:user][:email].to_s,
                :lastname => params[:user][:lastname].to_s,
              }
    payload_json = payload.to_json   
  	res_json = RestClient.post 'http://localhost:3030/users', payload_json, :content_type => 'application/json'
	  puts "res_json", res_json
    res = JSON.parse(res_json)
    puts "res", res
    if res.has_key?("id")
      session[:user_id] = res["id"]
      session[:user_name] = res["name"]
  	  @response = "User has been created successfully!!"
      @user_id = res["id"]
    else
      @response ="Unfortunately, there is something wrong" 
	  end
    ##redirect_to welcome_signup_path
  end

  def encrypt_password ( passo ) 
      hashed_pass = Digest::MD5.hexdigest (passo)
      return hashed_pass
  end

  def login  
    @tempo = encrypt_password ( params[:user][:password].to_s )  
    payload = {:username => params[:user][:username].to_s, :password => @tempo.to_s} 
    payload_json = payload.to_json 
  	res_json = RestClient.post 'http://localhost:3030/users/login', payload_json, :content_type => 'application/json'	
    puts "res_json", res_json
    res = JSON.parse(res_json) 
    puts res.has_key?("id").to_s
    if res.has_key?("id") #YESS
      session[:user_id] = res["id"]
      session[:user_name] = res["name"]
      @response = "You are logged in successfully!!"
    else
      @response ="Unfortunately, there is something wrong" 
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to welcome_index_path
  end

end
# 1.6.1  # RestClient.post 'http://example.com/resource', 'the post body', :content_type => 'text/plain'
