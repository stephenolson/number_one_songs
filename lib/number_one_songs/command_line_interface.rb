class NumberOneSongs::CommandLineInteface

  def run
    NumberOneSongs::Scraper.scrape_songs
    welcome
  end
  
  def welcome 
    puts "List of Billboard Hot 100 number-one singles from 1958 - 2019"
    puts "Do you wish to see songs by Decade or Year?"
    input = gets.strip
    
    case
      # when input.downcase == "decade"
      #   decade
      when input.downcase == "year"
        year
    end
  end

  # def decade
  
  # end

  def year
    puts "Please enter the year between 1958 - 2019 that you wish to see."

    input = gets.strip
    songs_by_year(input)
  end

  def songs_by_year(input)
    puts "Displaying the number one songs for #{input}."
    NumberOneSongs::Song.all.each_with_index(1) do |song, i|
      if song.date.include?(input)
        puts "#{i}. #{song.date}: #{song.single} by #{song.artist}"
      end
    end
  end
  
  def display_songs
    NumberOneSongs::Song.all.each do |song|
      if song.number.length > 0 
        puts "\n#{song.date}: #{song.single} by #{song.artist}"
        # puts "Weeks At Number One: #{song.weeks_at_number_one}"
      end
    end
  end

end