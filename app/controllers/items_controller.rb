class ItemsController < ApplicationController

  def search
    @items = show_items(params)
  end

  private
  def show_items(params)
    if params[:q].present? && (params[:q]["name_cont"].present?)
      @q.result(distinct: true).order('found_time desc')
    else
      render :search
    end
  end

end
