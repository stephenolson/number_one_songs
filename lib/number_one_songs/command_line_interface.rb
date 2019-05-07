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
      else
        invalid_choice
        welcome
    end
  end

  def artist
    puts "\nPlease enter the artist that you wish to see.\n"
    input = gets.strip
    results = NumberOneSongs::Song.find_by_artist(input)
    
    if results != nil
      results.each_with_index {|result,i| puts "#{i+1}. #{result.single} by #{result.artist}"}
    else
      invalid_choice
      artist
    end
    more_info(results)
  end

  def year
    puts "Please enter the year between 1958 - 2019 that you wish to see."
    input = gets.strip
    results = NumberOneSongs::Song.find_by_year(input)

    if results.length > 0
      results.each_with_index {|result,i| puts "#{i+1}. #{result.date} - #{result.single} by #{result.artist}"}
    else
      invalid_choice
      year
    end
    more_info(results)
  end

  def more_info(results)
    puts "\nPlease enter the song you want more information on.\n"
    input = gets.strip

    case
      when input.to_i.between?(1, results.size)
        song = results[input.to_i-1]
        display_song(song)
      else
        invalid_choice
        more_info(results)
    end
  end

  def display_song(song)
    puts "\n#{song.date}"
    puts "#{song.single} by #{song.artist}"
    puts "#{song.weeks_at_number_one} weeks at Number One."
    continue
  end

  def continue
    puts "\nWould you like information on another song? Enter Y or N\n"

    input = gets.strip.downcase
    case input
      when "y"
        welcome
      when "n", "exit"
        exit
      else
        invalid_choice
        continue
    end
  end

  def invalid_choice
    puts "\nInvalid Choice, Please Try Again!".colorize(:red)
  end

  def exit
    puts "\nCheck back next week for the latest Billboard Hot 100!"
    exit!
  end
end