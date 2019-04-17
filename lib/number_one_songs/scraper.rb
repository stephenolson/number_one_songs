class NumberOneSongs::Scraper

    def self.scrape_songs
      doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_Billboard_Hot_100_number-one_singles_of_the_2010s"))
      doc.xpath('//table[@class="wikitable sortable"]').each do |song|
        NumberOneSongs::Song.new(
        number = song.css("td")[0].text.strip,
        reached_number_one = song.css("td")[1].text.strip,
        artist = song.css("td")[2].text.strip,
        single = song.css("td")[3].text.strip,
        weeks_at_number_one = song.css("td")[4].text.strip)
        # reference = song.css('div.chart-list-item__lyrics a').map { |link| link['href'] }.join,
      end
    end
  
  end