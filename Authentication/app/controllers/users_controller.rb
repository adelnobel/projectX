class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end 

  def login_attempt
    user = User.exists?(username: params[:user][:username],password: params[:user][:password]) 
    respond_to do |format|
      # format.json {  render :json => @authorized_user}
      if user
        tempUser = User.where(username: params[:user][:username]).first
        id = tempUser[:id]
        reto = {:id => id, :name => tempUser[:username]}
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :json => reto }
      else
        # format.html { render :new }
        reto = {}
        format.json { render :json => reto }
      end
    end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        reto = {:id => @user[:id], :name => @user[:username]}
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :json => reto}
      else
        reto = {}
        # format.html { render :new }
        format.json { render :json => reto}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        # format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :password, :email, :username)
    end
end
