class Song 
  attr_accessor :name, :artist, :genre

  @@all = []
  
  def initialize(name, artist=nil, genre=nil) # can be invoked with optional argument, object to be assigned to property
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end 
  
  # invokes Artist#add_song to add itself to the artist's collection of songs(artist has many songs)
  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end 
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end 

end