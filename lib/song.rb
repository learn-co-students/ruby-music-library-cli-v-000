class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
    self.save
  end

  def self.create(name)
    song = self.new(name)
    song
  end

  def self.new_from_filename(filename)
    filename = filename.split(/ - |\./)
    artist = filename[0]
    artist = Artist.find_or_create_by_name(artist)
    genre = filename[2]
    genre = Genre.find_or_create_by_name(genre)
    song = filename[1]
    Song.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def artist=(artist)
    @artist = artist
    if self.artist != nil
      self.artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != nil
      genre.songs << self if !genre.songs.include?(self)
    end
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      Song.create(name)
    end
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end
end
