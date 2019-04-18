class NumberOneSongs::Song

  attr_accessor :number, :date, :artist, :single, :weeks_at_number_one
  
  @@all = []
  
  def initialize(number=nil, date=nil, artist=nil, single=nil, weeks_at_number_one=nil)
    @number = number
    @date = date
    @artist = artist
    @single = single
    @weeks_at_number_one = weeks_at_number_one
  
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end