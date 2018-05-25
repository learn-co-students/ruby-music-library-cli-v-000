
class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist

    self.genre = genre if genre
    # artist.add_genre(genre)
    
  end

  def artist= (artist)
    @artist = artist

    artist.add_song(self)

  end

  def genre= (genre)
    @genre = genre
    genre.add_song(self)
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
    # if @@all.include?(song) == false
     song = self.new(song)
     song.save
     song
  end

  def self.find_by_name(name)
    # binding.pry
    all.detect do |a| a.name == name

    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    a = filename.split(" - ")[2]
    genre_name = a.split('.mp3')[0]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name,artist,genre)

  end

  def self.create_from_filename(filename)
    a = self.new_from_filename(filename)
    a.save
    a
  end

end
