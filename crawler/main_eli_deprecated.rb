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

    #條件
    column_name_array = ["name","place","found_time","image","source_site","source_url","remark"]

    #物品內容 非必要

    #集合成所有物品列表
    result = get_all_result(450000..500000, @url+"oP01A01Q_01Action.do?method=doSelect&action=query&pbSeqNo=")

binding.pry
    #save
    #save_csv_file('abc.csv',column_name_array, result)
  end

  def get_all_result(range,baseurl)
    result = []
    range.each do |key|
      p key
      source_url = baseurl+key.to_s
      @session.visit source_url

      @session.visit @url+"oP01B02M_01Action.do?method=doPicShow"
      image = ""
      @session.visit @url+"oP01B02M_01Action.do?method=doList"

      if @session.all('tr td textarea')[0].nil?
        break
      end

      name = @session.all('tr td textarea')[0].text[/\：(.*?)，/,1]
      place = "#{@session.all('tr td input')[4].value}，#{@session.all('tr td input')[7].value}"
      found_time = @session.all('tr td input')[5].value.insert(3,'-').insert(6,'-')
      source_site = "內政部警政署"
      remark = ""

      #物品資料細節
      #物品品名、地點、時間、圖片、來源網站、來源url、備註
      #name,place,found_time,image,source_site,source_url,Remark
      keyword_location_array = [name,place,found_time,image,source_site,source_url,remark]

      result << keyword_location_array

    end
    result
  end

  def source_url
    baseurl+key.to_s
  end
end

Hoge.new("http://eli.npa.gov.tw/NPA97-217Client/").scrape_include_js_contents


