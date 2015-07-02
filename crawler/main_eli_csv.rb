require 'csv'
require 'pry'
require './lib/save_csv'
class CsvGetter
  include SaveCsv


  def run

    result = []
    column_name_array = ["name","place","found_time","image","source","source_site","source_url","remark"]
    CSV.foreach("tmp/NPA_OP1.csv") do |row|

      image = ""
      name = row[6][/\：(.*?)，/,1]
      place = row[5]
      found_time = row[4].insert(4,'-').insert(7,'-')[0,10]
      source = "#{row[1]} #{row[2]} #{row[3]}"
      source_site = "內政部警政署"
      source_url = ""
      remark = row[0]

      #物品資料細節
      #物品品名、地點、時間、圖片、來源網站、來源url、備註
      #name,place,found_time,image,source_site,source_url,Remark
      keyword_location_array = [name,place,found_time,image,source, source_site,source_url,remark]
      p keyword_location_array
      result << keyword_location_array
    end

    save_csv_file('perm/npa.csv',column_name_array, result)

  end
end


CsvGetter.new.run