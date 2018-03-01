class ResultSearchPage < SitePrism::Page

  #List of Titles
  elements :title_list, 'h2 a'

  #List of Prices
  elements :price_list, '.price '

  #Total Result
  element :total_result, '.list-count'

  #SortBy dropdown
  element :sortby_dropdown, 'div.ms-parent:nth-child(3) > button:nth-child(1)'
  elements :sortby_list_dropdown, 'div.ms-parent:nth-child(3) > div:nth-child(2) > ul:nth-child(1) > li'


  def sortBy(sort)
    wait_until_sortby_dropdown_visible
    sortby_dropdown.click
    sortby_list_dropdown.map{|opt| opt.click if opt.text.downcase.eql?(sort.downcase)}

    #waiting to refresh the page
    sleep(3)
  end

  def getTotalResult
      wait_until_total_result_visible
      return total_result.text.gsub('results' , '').strip.to_i
  end

  def getCountTitle
      wait_until_title_list_visible
      return title_list.count
  end

  def getTitle
      wait_until_title_list_visible

      @list_all_titles = Array.new(title_list.count)
      index = -1
      title_list.map do | title |
        index += 1
        @list_all_titles[index] = title.text
      end
  end

  def getPrice
      wait_until_price_list_visible

      @list_all_prices = Array.new(price_list.count)
      index = -1
      price_list.map do | price |
        index += 1
        @list_all_prices[index] = price.text
      end
  end

  def format_CSV_File
    #Get all Titles
    getTitle

    #Get all Prices
    getPrice

    #Open File
    openFile

    #Write File in a csv format
    writeFile

    #Close File
    closeFile
  end

  def openFile
      Dir.mkdir('files') unless Dir.exist?('files')
      @filecsv = File.open("files/resultList.csv",  "w+")
  end

  def writeFile
      @filecsv.puts "listing title - price"
      for i in 0..(@list_all_titles.size-1)
        @filecsv.puts @list_all_titles[i] + " - " + @list_all_prices[i]
      end
  end

  def closeFile
      @filecsv.close
  end

end