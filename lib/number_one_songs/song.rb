class NumberOneSongs::Song

  attr_accessor :number, :reached_number_one, :artist, :single, :weeks_at_number_one, :reference
  
  @@all = []
  
  def initialize(number=nil, reached_number_one=nil, artist=nil, single=nil, weeks_at_number_one=nil, reference=nil)
    @number = number
    @reached_number_one = reached_number_one
    @artist = artist
    @single = single
    @weeks_at_number_one = weeks_at_number_one
    @reference = reference
  
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end