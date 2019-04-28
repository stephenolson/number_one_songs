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
      when input.downcase == "artist"
        artist
      when input.downcase == "year"
        year
    end
  end

  def artist
    puts "Please enter the artist that you wish to see."
    
    input = gets.strip
    songs_by_artist(input)
  end

  def songs_by_artist(input)
    puts "Displaying the number one songs by #{input}."
    results = []
    NumberOneSongs::Song.all.each do |song|
      if song.artist.downcase.include?(input.downcase)
        results << song
      end
    end
    
    results.each_with_index do |results,i|
      puts "#{i+1}. #{results.single} by #{results.artist}"
    end

    more_info(results)
  end

  def more_info(results)
    puts "\nPlease enter the song you want more information on.\n"
    input = gets.strip

    song = results[input.to_i-1]
    display_song(song)
  end

  def year
    puts "Please enter the year between 1958 - 2019 that you wish to see."

    input = gets.strip
    songs_by_year(input)
  end

  def songs_by_year(input)
    puts "Displaying the number one songs of #{input}."
    results = []
    NumberOneSongs::Song.all.each do |song|
      if song.date.include?(input)
        results << song
      end
    end

    results.each_with_index do |results,i|
      puts "#{i+1}. #{results.date} #{results.single} by #{results.artist}" 
    end

    more_info(results)
  end

  def display_song(song)
    puts "\n#{song.date}"
    puts "#{song.single} by #{song.artist}"
    puts "#{song.weeks_at_number_one} weeks at number one."
  end

end