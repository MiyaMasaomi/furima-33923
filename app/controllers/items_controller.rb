class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index, except: [:index]
  def index
  end

  def new
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
