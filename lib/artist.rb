class Artist 

 
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name

  end
  
  def self.destroy_all
 
  end
  
  def save

  end
  
  def self.create(name)

  end

  def add_song(song)
  
  end

  def genres

  end

end