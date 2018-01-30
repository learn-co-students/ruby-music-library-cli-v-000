require_relative "../concerns/concerns.rb"

class Genre
  
  attr_accessor :name
  attr_reader :songs

  @@all = []

  extend Concerns::Findable

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all   
  end

  def self.destroy_all
    @@all = []
  end

  def save
    unless @@all.any? { |genre| genre.name == self.name }
      @@all << self
    end
  end

  def add_song(song)
    if song.class == Song && !self.songs.any? { |saved_song| saved_song.name == song.name }
      self.songs << song
    end
  end

  def artists
    artists = []
    songs.each do |song|
      unless artists.any? { |artist| artist.name == song.artist.name }
        artists << song.artist
      end
    end
    artists
  end
end