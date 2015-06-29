class ItemsController < ApplicationController

  def search
    @items = @q.result(distinct: true).limit(10)
    render index1_welcome_index_path
  end

end
