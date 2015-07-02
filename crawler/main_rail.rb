require './lib/capybara_with_phantom_js'
require './lib/save_csv'
require 'nokogiri'
require 'pry'
class Hoge
  include CapybaraWithPhantomJs
  include SaveCsv

  def initialize(url)
    @url = url
  end

  def scrape_include_js_contents
    @session = new_session

    #物品內容 非必要
    css_condition = 'tr td.text_12pt span.blue03'
    column_name_array = ["name","place","found_time","image","source", "source_site","source_url","remark"]


    #集合成所有物品列表
    result = get_all_result(130000..155004, @url+"lost_Detail.aspx?SN=", css_condition)


    #save
    save_csv_file('perm/rails.csv',column_name_array, result)
  end

  def get_all_result(range,baseurl,css_condition)
    result = []
    range.each do |key|
      @session.visit baseurl+key.to_s
      obj = {:attr => @session.all(css_condition), :url => @session.current_url }

      #物品資料細節
      #物品品名、地點、時間、圖片、來源網站、來源url、備註
      #name,place,found_time,image,source_site,source_url,Remark

      keyword_location_array = ["#{obj[:attr][3].text}",
      "#{obj[:attr][5].text}，#{obj[:attr][2].text}",
      "#{obj[:attr][1].text}",
      "",
      "#{obj[:attr][7].text}",
      "台鐵",
      "#{obj[:url]}",
      "#{obj[:attr][4].text}"]
      p keyword_location_array

      result << keyword_location_array

    end
    result
  end
end

Hoge.new("http://www.railway.gov.tw/tw/").scrape_include_js_contents
