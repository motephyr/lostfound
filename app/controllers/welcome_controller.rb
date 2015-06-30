class WelcomeController < ApplicationController

  def index1
    @items = Item.order('found_time desc').limit(100)
  end

end