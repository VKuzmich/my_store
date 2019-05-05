class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]


  def index
    @items = Item.all
    # @items = Item.all
    # render :plain => @items.map { |i| "#{i.name} #{i.price}" }.join("\n")
  end


  def allowed_params
    params.require(:item).permit(:price, :name, :description, :weight)
  end

  #  /items POST
  def create
    @item = Item.create(allowed_params)

    if @item.errors.empty?
      redirect_to item_path(@item) # items/id
    else
      render "new"
    end
  end


  # /items/1 GET
  def show
    unless @item
      render :plain => "Page not found", status => 404
    end
  end


  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items/1 PUT
  def update
    @item.update_attributes(allowed_params)
    if @item.errors.empty?
      redirect_to item_path(@item) # items/id
    else
      render "edit"
    end
  end



  #/items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  private

    def find_item
      @item = Item.find(params[:id])
    end

    def check_if_admin
      render plain: "Access denied", status: 403 unless params[:admin]
    end
end
