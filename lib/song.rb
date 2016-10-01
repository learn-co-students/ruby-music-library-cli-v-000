class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      genre.add_song(self)
    end
    self.save
  end

  def name
    @name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    self.new(name, artist, genre)
  end

end
