class NumberOneSongs::CommandLineInteface

  def run
    NumberOneSongs::Scraper.scrape_songs
    welcome
  end
  
  def welcome 
    puts "List of Billboard Hot 100 number-one singles from 1958 - 2019"
    puts "Do you wish to see songs by Artist or Year?"
    input = gets.strip
    
    case
      when input.downcase == "artist"
        artist
      when input.downcase == "year"
        year
    end
  end

  def artist
    puts "Please enter the artist that you wish to see."
    
    input = gets.strip

    NumberOneSongs::Song.find_by_artist(input.to_s).each.with_index do |result, i|
        puts "#{i+1} #{result.date} #{result.single} by #{result.artist}" 
      end
    
    

  end

end