class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
   self.songs << song unless songs.include?(song)
   song.artist = self if song.artist.nil?
  end

  def genres
    genres = self.songs.collect do |song| song.genre
    end
    genres.uniq
  end
end
