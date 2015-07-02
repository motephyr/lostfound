class ItemsController < ApplicationController

  def index
    @items = show_items(params)
  end

  private
  def show_items(params)
    if params[:q].present? && (params[:q]["name_cont"].present? || params[:q]["found_time"].present?)
      @q.result(distinct: true).order('found_time desc').limit(1000)
    else
      render :search
    end
  end

end
