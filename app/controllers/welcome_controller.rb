class WelcomeController < ApplicationController

  def index1
    @items = Item.order('found_time desc').limit(50)
  end

end