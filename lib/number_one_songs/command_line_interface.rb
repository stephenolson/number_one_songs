class NumberOneSongs::CommandLineInteface

  def run
    NumberOneSongs::Scraper.scrape_songs
    welcome
  end
  
  def welcome 
    display_songs
  end
  
  def display_songs
    NumberOneSongs::Song.all[0,1].each do |song, index|
      puts "#{song.number}"
      # puts "#{song.number}. #{song.single} by #{song.artist}"
      # puts "Reached Number One: #{song.reached_number_one}"
      # puts "Weeks At Number One: #{song.weeks_at_number_one}"
    end
  end

end