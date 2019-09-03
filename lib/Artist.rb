class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
  #Instance Methods

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    new_song = song
    self.songs.include?(new_song) ? nil : self.songs << new_song
    new_song.artist == nil ? new_song.artist = self : nil
  end

  def genres
    genre_collection = []
    self.songs.each do |song|
      genre_collection.include?(song.genre) ? nil : genre_collection << song.genre
    end
    genre_collection
  end

  #Class Methods

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    @@all = []
  end

end
