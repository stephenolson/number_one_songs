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
    self.all.select { |results| results.values == artist }
  end

  # def self.find_by_artist
  #   songs.collect {|song| song.artist}
  # end

  # def self.find_by_year(date)
  #   self.all.detect{|x| x.date == date}
  # end

  
  
end