class ItemsController < ApplicationController

  def index
    @items = show_items(params)
    if @items.present?
      @og = set_page_info(params,@items.first)
    else
      render :search
    end
  end

  private
  def show_items(params)
    if params[:q].present? && (params[:q]["name_cont"].present? || params[:q]["found_time"].present?)
      @q.result(distinct: true).order('found_time desc').limit(1000)
    end
  end

  def set_page_info(params, item)
    title = "#{params[:q]["name_cont"]}"
    description = (!item.blank?) ? item.place.gsub(/([_@#!%()\-=;><,{}\~\/\?\"\*\^\$\+\-]+)/, "").gsub(/\s/, " ") : ""

    set_page_title       title
    set_page_description description

    {title: "#{title} | #{Setting.app_name}",
      type:"product",
      url: request.original_url,
      image: item.image,
      site_name: Setting.app_name,
      description: description,
      fb_admins: Setting.facebook_admins,
      fb_app_id: Setting.facebook_app_id
    }
  end

end
