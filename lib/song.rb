class Song
  @@all = []
  
  attr_accessor :name, :artist, :genre

  def initialize(name:, artist: = nil, genre: = nil)
    @name = name
    self.artist=(artist) if artist
    @genre = genre
  end
  
  def artist=(artist_name)
    if Artist.find_by_name(artist_name)
      Artist.find_by_name(artist_name).songs << self
      @artist = Artist.find_by_name(artist_name)
    else
      new_artist = Artist.create(artist_name)
      new_artist.songs << self
      @artist = new_artist
    end
  end
  
  def create(name)
    new_song = Song.new(name)
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

end