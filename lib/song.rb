class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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

  def self.create(name, artist = nil, genre = nil)
     song = Song.new(name, artist, genre)
     song.save
     song
    end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    new_a = splits[0]
    new_s = splits[1]
    new_g = splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(new_a)
    genre = Genre.find_or_create_by_name(new_g)
    song = Song.new(new_s, artist, genre)
  end

  def self.create_from_filename(filename)
    splits = filename.split(" - ")
    new_a = splits[0]
    new_s = splits[1]
    new_g = splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(new_a)
    genre = Genre.find_or_create_by_name(new_g)
    self.create(new_s, artist, genre)
  end

end
