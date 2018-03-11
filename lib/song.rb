require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre != nil
      self.genre=(genre)
    end
    if artist != nil
      self.artist=(artist)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear #all.clear also works
  end

  def save
    @@all << self #self.class.all << self also works
  end

  def self.create(name)
    created_song = self.new(name) #just new(name) also works
    created_song.save
    created_song
    #binding.pry
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #adds current instance of song (self) to artist's @songs array
    #binding.pry
    #self.artist = artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create(song_name)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre_name = filename.split(" - ")
    correct_genre = genre_name.chomp(".mp3")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(correct_genre)
    new(song, artist, genre)
#binding.pry
  end

  def self.create_from_filename(filename)
    #binding.pry
    new_from_filename(filename).save
  end
end
