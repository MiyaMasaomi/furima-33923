class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.all
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
