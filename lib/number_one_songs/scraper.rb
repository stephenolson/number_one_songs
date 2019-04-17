class NumberOneSongs::Scraper

  def self.scrape_songs
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_2010s"))
    doc.xpath("//table[@class='wikitable sortable']").map do |song|
      NumberOneSongs::Song.new(
      number = song.css("tr td").text.strip)
      # reached_number_one = song.css("tr").text.strip
      # artist = song.css("td").text.strip,
      # single = song.css("td").text.strip,
      # weeks_at_number_one = song.css("td").text.strip)
      # reference = song.css('div.chart-list-item__lyrics a').map { |link| link['href'] }.join,
    end
  end
  
end

  #   def self.scrape_songs
  #     doc = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100"))
  #     doc.css("div.chart-list-item").each do |song|
  #       NumberOneSongs::Song.new(
  #       number = song.css(".chart-list-item__rank").text.strip,
  #       reached_number_one = song.css(".chart-list-item__title-text").text.strip,
  #       artist = song.css(".chart-list-item__artist").text.strip,
  #       single = song.css(".chart-list-item__last-week").text.strip,
  #       weeks_at_number_one = song.css(".chart-list-item__weeks-at-one").text.strip)
  #     end
  #   end
  
  # end