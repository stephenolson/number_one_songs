class NumberOneSongs::CommandLineInteface

  def run
    NumberOneSongs::Scraper.scrape_songs
    welcome
  end
  
  def welcome 
    display_songs
  end
  
  def display_songs
    NumberOneSongs::Song.all.each do |song|
      puts "\nWelcome to the this weeks Billboard Hot 100!\n"
      puts "\n#{song.number}. #{song.single} by #{song.artist}"
      puts "Reached Number One: #{song.reached_number_one}"
      puts "Weeks At Number One: #{song.weeks_at_number_one}"
      puts "Reference: #{song.reference}"
    end
  end

end