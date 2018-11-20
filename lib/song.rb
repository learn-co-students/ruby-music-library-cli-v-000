class Song 
  @@all = []

  attr_accessor :name, :artist
  attr_reader :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    @artist = artist 
    @genre = genre
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end 
  
  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear 
  end 
  
    def save 
      self.class.all << self
    end 
    
    def self.create(name)
      song = self.new(name)  
      self.all << song
      song
    end
    
    def artist=(artist)
      @artist = artist
      artist.add_song(self) 
    end
    
    def genre=(genre)
      @genre = genre 
      genre.songs << self unless genre.songs.include?(self)
    end

end
  