class Song
  
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []



  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist != nil
    genre.add_song(self) if genre != nil
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

  def Song.create(name)
    song = self.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self unless artist.songs.include?(self)
    artist.add_song(self) 
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
    genre.add_song(self)
  end

def self.find_by_name(name)
  self.all.detect { |song| song.name == name}
end

def self.find_or_create_by_name(name)
  self.all.detect { |song| song.name == name} || self.create(name)  

end

end