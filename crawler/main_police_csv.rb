

require 'csv'
require 'pry'
require './lib/save_csv'
class CsvGetter
  include SaveCsv


  def run

    result = []
    column_name_array = ["name","place","found_time","image","source","source_site","source_url","remark"]

    array = Marshal.load(File.read('tmp/testmarshal'))
    array.each do |row|

      image = row[:img]
      name = row[:text].split(' ',3)[2]
      place = ""
      found_time = row[:text].split(' ')[1].insert(3,'/').insert(6,'/')[0,9]
      source = ""
      source_site = "警廣"
      source_url = ""
      remark = ""

      #物品資料細節
      #物品品名、地點、時間、圖片、來源網站、來源url、備註
      #name,place,found_time,image,source_site,source_url,Remark
      keyword_location_array = [name,place,found_time,image,source, source_site,source_url,remark]
      p keyword_location_array
      result << keyword_location_array
    end

    save_csv_file('perm/police.csv',column_name_array, result)

  end
end


CsvGetter.new.run