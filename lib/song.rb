require 'pry'

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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
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
    #could also use method .detect returns the first for which the block is not false
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
    # if find_by_name(name)
    #   return find_by_name(name)
    # else
    #   create(name)
    # end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist_name, song_name, genre_name = array[0], array[1], array[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end
  # similar way to solve this
  # def self.new_by_filename(filename)
  #   song = self.new(filename.split(" - ")[1])
  #   song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
  #   song
  #   end
  # end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap do |song|
       song.save
     end
  end
  
end
