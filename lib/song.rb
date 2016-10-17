class Song
  attr_accessor :name, :artist, :genre
  attr_reader :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(song)
    Song.new(song).save
    self
  end

  def genre=(genre)
    if genre.songs.include?(self) == false
      genre.songs << self
    end
    @genre = genre
  end

  def create_from_name(name)
    self.new.tap do |o|
      o.name = name
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    new(song[1], Artist.find_or_create_by_name(song[0]))
  end

  def self.create_from_filename(filename)
    song = filename.split(" - ")
    self.create.tap do |o|
      o.name = song[0]
    end
  end

end
