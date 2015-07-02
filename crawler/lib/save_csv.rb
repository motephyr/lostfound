require 'csv'

module SaveCsv

  # Create a new PhantomJS session in Capybara
  def save_csv_file(new_file_name,column_name_array,result_array)

    CSV.open(new_file_name, "wb") do |csv|
      csv << column_name_array
      save_csv_result(result_array) { |row| csv << row }
    end
  end

  private
  def save_csv_result(array, &block)
    array.each do |i|
      yield(i)
    end
  end

end