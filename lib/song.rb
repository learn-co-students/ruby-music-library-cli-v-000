class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if genre
      self.genre = genre
    end

    if artist
      self.artist = artist
    end

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    self.new(song).tap {|name|
    name.save}
  end

  def self.find_by_name(song_name)
    @@all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
      self.find_by_name(song_name) ||    self.create(song_name)
  end

  def self.new_from_filename(filename) 
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename) # same thing as .new_from_filename, but also saves the newly-created song to @@all class variable.
    @@all << self.new_from_filename(filename)
  end
end
