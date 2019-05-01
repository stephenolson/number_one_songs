class NumberOneSongs::Song

  attr_accessor :number, :date, :artist, :single, :weeks_at_number_one
  
  @@all = []

  def self.create(songs)
    songs.each do |song|
      self.new(song)
    end
  end
  
  def initialize(song_hash)
    song_hash.each do |key, value| 
      self.send(:"#{key}=", value)
    end
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.find_by_artist(artist)
    self.all.select {|song| song.artist.include?(artist)}
  end


  # def self.find_by_artist(artist)
  #   results = []
  #   self.all.collect do |song| 
  #     if song.artist.include?(artist) 
  #       results << song
  #     end
  #   end
  #   return results
  # end

  # def self.find_by_artist
  #   songs.collect {|song| song.artist}
  # end

  # def self.find_by_year(date)
  #   self.all.detect{|x| x.date == date}
  # end

  
  
end