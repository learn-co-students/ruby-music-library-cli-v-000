class Song

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      genre.songs << self
    end
    @genre = genre
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
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

  def count
    @@all.size
  end

  def self.new_from_filename(file)
    split = file.split(" - ")

    artist = split[0]
    song_name = split[1]
    genre = split[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
    song
  end
end
