class ItemsController < ApplicationController

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
    unless @item = Item.where(id: params[:id]).first
      render :plain => "Page not found", status => 404
    end
  end


  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
    @item = Item.find(params[:id])
  end

  # /items/1 PUT
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(allowed_params)
    if @item.errors.empty?
      redirect_to item_path(@item) # items/id
    else
      render "edit"
    end
  end



  #/items/1 DELETE
  def destroy

  end

end
