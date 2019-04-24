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
  
end