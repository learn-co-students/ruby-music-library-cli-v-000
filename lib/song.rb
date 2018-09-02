class Song 

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @songs = []
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def self.new_from_filename(name)
    self.new(
      s_name(name),
      Artist.find_or_create_by_name(a_name(name)),
      Genre.find_or_create_by_name(g_name(name)))
  end
  

  def self.create_from_filename(name)
    self.new_from_filename(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    (song = find_by_name(name)) ? song : self.create(name) 
  end
    
  def self.s_name(fn)
    fn.split(" - ")[1]
  end
  
  def self.a_name(fn)
    fn.split(" - ")[0]
  end
  
  def self.g_name(fn)
    fn.split(" - ")[2].gsub(".mp3", "")
  end

end