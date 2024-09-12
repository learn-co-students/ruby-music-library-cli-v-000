class Song
  attr_accessor :name
  attr_reader :artist, :genre

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
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap{|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist_name = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre_name = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    self.new(song_name, artist_name, genre_name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song| song.save}
  end


end
