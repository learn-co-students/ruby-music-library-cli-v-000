require 'pry'
class Artist
  include Concerns::Findable
  attr_accessor :name, :songs, :genre, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new(name).tap{|s| s.save}
    #binding.pry
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  # binding.pry
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
    #self.songs.collect do |song|
    #  song.genre
    #binding.pry
    #end.uniq
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|s| s.save}
#          @@all << self.new_from_filename(file)
#          self.new_from_filename(file)
#
#       end
  end

  def self.new_from_filename(file)
    #binding.pry
    file = file.split(" - ")
    artist = file[0]
    song = file[1]
    genre = file[2].gsub(".mp3", "")
    #binding.pry
    new_song = self.new_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)

    new_song.artist.add_song(new_song)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song.genre.add_song(new_song)
    new_song #want to use tap here
    end
end
