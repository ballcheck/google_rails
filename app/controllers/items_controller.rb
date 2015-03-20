class ItemsController < ApplicationController

  def index
    @items = Item.all

    render :text => nil
  end

end
