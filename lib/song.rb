class Song
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      artist.add_song(self)
    else
    end
    if genre != ""
      self.genre = genre
    else
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
