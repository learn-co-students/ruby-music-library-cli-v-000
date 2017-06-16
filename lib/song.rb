class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def artist=(artist)
    if artist.class == Artist
      @artist = artist
      # artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.class == Genre
      @genre = genre
      genre.songs << self if !genre.songs.include?(self)
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

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre).tap{|song| song.save}
  end

  def self.find_by_name(name)
    @@all.detect{|thing| thing.name == name}
  end

  def self.find_or_create_by_name(name)
    @@all.any?{|thing| thing.name == name} ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    data = filename.split(/\s-\s|.mp3/)
    song = self.new(data[1],Artist.find_or_create_by_name(data[0]),Genre.find_or_create_by_name(data[2]))
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(/\s-\s|.mp3/)
    song = self.create(data[1],Artist.find_or_create_by_name(data[0]),Genre.find_or_create_by_name(data[2]))
    song
  end

end
