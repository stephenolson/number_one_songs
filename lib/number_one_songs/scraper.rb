class NumberOneSongs::Scraper

  def self.scrape_songs
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_2010s"))

    doc.search("sup").remove
    doc.css("table.wikitable.sortable tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      reached_number_one = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[5]").text.strip)
    end
  end

  def self.scrape_songs
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_1990s"))

    doc.search("sup").remove
    doc.css("table.sortable.wikitable tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      reached_number_one = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
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