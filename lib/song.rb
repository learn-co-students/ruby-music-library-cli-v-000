class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name

    artist.add_song(self) unless artist == ""
    genre.add_song(self) unless genre == ""
    self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) unless nil
    self.create(name)
  end

  def self.new_from_filename(filename)
    # artist - name - genre.mp3
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    name = filename.split(" - ")[1]
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    #binding.pry
    song = self.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
