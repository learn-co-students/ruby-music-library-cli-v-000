require 'pry'

class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    puts "Artist #{name} does not exist. Creating..."
    new_artist = Artist.new(name)
    # binding.pry
    new_artist.save
    new_artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    @songs.include?(song) ? (puts 'Song already in collection.') : @songs << song
    song.artist == self ? nil : song.artist = self
    @songs
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

end
