class Song   
   
  attr_accessor :name , :genre, :filename
  attr_reader :artist

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  

   def self.create(name)
    song = Song.new(name)
    song.save
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
  
   def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
   end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
   def self.new_by_filename(filename)
   end
  
  

  
  
  
end