require_relative "../concerns/concerns.rb"

class Artist

  attr_accessor :name
  attr_reader :songs

  @@all = []

  extend Concerns::Findable

  def initialize(name)
    self.name = name
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
    @@all = []
  end

  def save
    unless @@all.any? { |artist| artist.name == self.name }
      @@all << self
    end
  end

  def add_song(song)
    if song.class == Song && !self.songs.any? { |saved_song| saved_song.name == song.name }
      self.songs << song
      self.songs.last.artist = self
    end
  end

  def genres
    genres = []
    songs.each do |song|
      unless genres.any? { |genre| genre.name == song.genre.name }
        genres << song.genre
      end
    end
    genres
  end


  
end