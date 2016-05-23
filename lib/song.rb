require'pry'
class Song

  attr_accessor :song, :artist, :name, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    #if artist exist, then make self.artist
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
     artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    all.map do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(song)
    array = song.split(" - ")
    artist_name = array[0]
    artist = Artist.find_or_create_by_name(artist_name)
    title = array[1]
    genre_name = (array[2].chomp(".mp3"))
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(title, artist, genre)
  end






end