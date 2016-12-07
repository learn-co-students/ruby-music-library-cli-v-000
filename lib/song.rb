class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist
      @artist = artist
      artist.songs << self
    end

    if genre
      @genre = genre
      genre.songs << self
    end
  end

  # adds the song to the artist's songs
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # adds the song to the genre's songs
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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

  def self.create(name, artist = nil)
    new(name, artist).tap{|s| s.save}
  end

  def self.find_by_name(name)
    @@all.find { |a| a.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
