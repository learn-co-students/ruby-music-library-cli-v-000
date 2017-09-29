require_relative "../config/environment.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :genre
  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
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

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

   def add_song(song)
     song.artist = self if song.artist == nil
     self.songs << song unless self.songs.include?(song)
   end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
  genres.uniq
  end

end