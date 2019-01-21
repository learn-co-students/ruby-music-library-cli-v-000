class Song 
  attr_accessor :name  
  attr_reader :artist, :genre

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(song_name)
    song_created = Song.new(song_name)
    song_created.save
    song_created
  end
  
 def artist=(artist)
   song = self
   @artist = artist
   artist.add_song(song)
 end
 
   def genre=(genre)
      song = self
      @genre = genre
      genre.add_song(song)
    end
  
  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end
    
end



