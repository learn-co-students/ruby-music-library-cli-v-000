class Song

  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create(name) : find_by_name(name)
  end

  def self.new_by_filename(filename)
    split = filename.split(" - ")
    song = Song.new(split[0])

  end

end
