class Artist 
  
  attr_accessor :name


  @@all = []

  def initialize(name)
    @name = name
    @@all = []
  end
  
  def self.all
    @@all
  end
  
  # def genres
  #   self.songs.collect {|song| song.genre}
  # end
  
  def destroy_all
    @@all = []
  end

  
  
  
end