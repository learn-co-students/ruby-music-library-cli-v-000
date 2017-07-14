
class Song
  #extend Concerns::Findable
  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist= (artist) if artist != nil
    self.genre= (genre) if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all  << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    self
  end

  def artist
    @artist
  end

  def artist=(artist_name)
    artist_name.add_song(self) unless artist_name.songs.include?(self)
    @artist = artist_name
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

def self.find_by_name(name)
    all.detect{|songs| songs.name == name}
end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end