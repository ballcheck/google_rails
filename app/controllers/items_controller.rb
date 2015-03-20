require_relative "../../lib/google/app/models/really_useful.rb"

class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    n = params["n"].to_i

    begin
     item_params = ReallyUseful.really_useful_method2( n )
     @item = Item.create!( item_params )
    rescue
      flash[:notice] = "An error occurred"
    else
      flash[:notice] = "New item created"
    end

    redirect_to :action => :index
    
  end

end
