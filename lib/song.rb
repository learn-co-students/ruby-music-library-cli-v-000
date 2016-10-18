class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
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

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|a| a.save}
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
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
    self.new(song[1], Artist.find_or_create_by_name(song[0]), Genre.find_or_create_by_name(song[2].split(".")[0]))
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
