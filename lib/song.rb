class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  extend Concerns::Findable
  def initialize(name, artist=nil, genre=nil)
    @name=name
    @artist=artist
    @genre = genre
    if @artist != nil
      self.artist.songs << self
    end
    if @genre != nil
      self.genre.songs << self
    end
  end
  def artist=(artist)
    if self.artist != nil
      self.artist
    else
      @artist=artist
      self.artist.add_song(self)
    end
  end
  def genre=(genre)
    if self.genre != nil
      self.genre
    else
      @genre=genre
      self.genre.songs << self
    end
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
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
end
