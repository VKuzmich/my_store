class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  # before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item
    @items = @items.where('price >= ?', params[:price_from]) if params[:price_from]
    @items = @items.where('created_at >= ?', 1.day.ago) if params[:today]
    @items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]
    @items = @items.order('votes_count DESC', 'price')
    # @items = Item.all
    # render :plain => @items.map { |i| "#{i.name} #{i.price}" }.join("\n")
  end

  #  /items POST
  def create
    @item = Item.create(item_params)

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
    @item.update_attributes(item_params)
    if @item.errors.empty?
      flash[:success] = "You have successfully updated your form!"
      redirect_to item_path(@item) # items/id
    else
      flash.now[:error] = "You have made mistake in your form!"
      render "edit"
    end
  end

  #/items/1 DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def expensive
    @items = Item.where("price > 10000")
    render "index"
  end

  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def item_params
    params.require(:item).permit(:price, :name, :description, :weight)
  end
end
