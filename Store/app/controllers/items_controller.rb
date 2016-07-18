class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    render :json => @items, status: :ok
  end

  # GET /items/1
  # GET /items/1.json
  def show
    render :json => @item.to_json
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        # format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        # format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def buy_item
    response = {}
    if params[:quantity].to_i <= 0
      response[:response] = 'Item quantity has to be a non-negative integer!'
    elsif Item.exists?(params[:id])
      new_item = Item.find(params[:id])
      if new_item.quantity.to_i >= params[:quantity].to_i
        new_item.quantity = new_item.quantity - params[:quantity].to_i
        response[:response] = 'Item quantity updated successfully!'
        if !new_item.save
          response[:response] = 'Error! Item could not be saved!'
        end
      else
        response[:response] = 'No sufficient quantity of Item ID ' + params[:id]
      end
    else
      response[:response] = 'Item ID ' + params[:id] + ' is not found!'
    end
    render :json => response.to_json
  end
  # def update
  #   respond_to do |format|
  #     if @item.update(item_params)
  #       #format.html { redirect_to @item, notice: 'Item was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @item }
  #     else
  #       #format.html { render :edit }
  #       format.json { render json: @item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /items/1
  # DELETE /items/1.json
  # def destroy
  #   @item.destroy
  #   respond_to do |format|
  #     # format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :price, :quantity)
    end
end
