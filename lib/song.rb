class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    @@all << self
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(string)
    new_song = Song.new(string)
  end

  def artist_name
    self.artist.name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end
 

end



####
