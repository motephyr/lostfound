class ItemsController < ApplicationController

  def search
    @items = show_items(params)
  end

  private
  def show_items(params)
    if params[:q].present? && (params[:q]["found_time"].present? || params[:q]["place_cont"].present?)
      @q.result(distinct: true)
    else
      flash[:warning] = "日期和地點須擇一填寫"
      render :search
    end
  end

end
