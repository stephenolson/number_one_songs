class NumberOneSongs::Scraper
  
  def self.scrape_songs
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_from_1958_to_1969"))
    table = doc.css("table.sortable.wikitable").first
    table.css("tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
    end

    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_1970s"))
    table = doc.css("table.sortable.wikitable").first
    table.css("tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
    end
    
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_1980s"))
    table = doc.css("table.sortable.wikitable").first
    table.css("tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
    end

    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_1990s"))
    table = doc.css("table.sortable.wikitable").first
    table.css("tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
    end

    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_2000s"))
    table = doc.css("table.sortable.wikitable").first
    table.css("tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[6]").text.strip)
    end

    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_2010s"))
    doc.search("sup").remove
    doc.css("table.wikitable.sortable tr").each do |song|
      NumberOneSongs::Song.new(
      number = song.css("td[1]").text.strip,
      date = song.css("td[2]").text.strip,
      artist = song.css("td[3]").text.strip,
      single = song.css("td[4]").text.strip,
      weeks_at_number_one = song.css("td[5]").text.strip)
    end
  end
end