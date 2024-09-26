class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    song = new(name)
    song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless @genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    fromfile = filename.split(/ \- |\./)
    newsong = self.find_or_create_by_name(fromfile[1])
    newsong.artist = Artist.find_or_create_by_name(fromfile[0])
    newsong.genre = Genre.find_or_create_by_name(fromfile[2])
    newsong
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
