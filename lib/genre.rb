class Genre < Super
  
  attr_accessor :songs 
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    instance = Genre.new(name)
    instance.save
    instance
  end
  
  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song if self.songs.include?(song) == false
  end
  
  def artists 
    self.songs.collect {|song|song.artist}.uniq 
  end

end