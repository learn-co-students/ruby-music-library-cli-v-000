class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def add_artist_genre_oneway(artist, genre)
    @artist = artist
    @genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    creation = self.new(name)
    creation.save
    creation
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found
      found
    else
      self.create(name)
    end
  end

  def self.new_from_filename(name)
    parsed = name.split(' - ')
    name = parsed[1]
    artist = Artist.new(parsed[0])
    genre = Genre.new(parsed[2].sub('.mp3', ''))

    song = self.new(name)
    song.add_artist_genre_oneway(artist, genre)
    song
  end
end
