class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil 
      self.genre=(genre)
    end
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
  
  def self.create(song)
    new(song).tap {|name| name.save}
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
    
  def self.new_from_filename(filename)
    Song.new(filename.split(" - ")[1], Artist.find_or_create_by_name(filename.split(" - ")[0]), Genre.find_or_create_by_name(File.basename(filename, ".mp3").split(" - ")[2]))
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end
 
end