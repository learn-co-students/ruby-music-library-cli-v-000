class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = Artist.new(""), genre = Genre.new(""))
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    if self.artist != artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if self.genre != genre
      @genre = genre
      genre.songs << self
    end
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

  def self.create(name)
    new = self.new(name)
    new.save
    new
  end

  def self.find_by_name(name)
    self.all.detect{|object| object.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    song = Song.find_or_create_by_name(names[1])
    song.artist = Artist.find_or_create_by_name(names[0])
    song.genre = Genre.find_or_create_by_name(names[2].split(".")[0])
    song
  end

  def self.create_from_filename(filename)
    new = self.new_from_filename(filename)
    new.save
    new
  end

end
