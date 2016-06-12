require_relative "../concerns/findable.rb"

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    self
  end

  def self.create(name)
    Genre.new(name).save
  end

  def add_song(song)
    song.genre ||= self
    @songs << song unless @songs.include?(song)
  end

  def artists
    artists = @songs.collect { |song| song.artist }
    artists.uniq
  end

  def self.list_genres
    self.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def self.list_songs(genre_name)
    self.find_by_name(genre_name).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end