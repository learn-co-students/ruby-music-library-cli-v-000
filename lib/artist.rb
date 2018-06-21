class Artist
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def genres
    genre_array = []
    @songs.collect do |song_name|
      genre_array << song_name.genre if !genre_array.include?(song_name.genre)
    end
    genre_array
  end

  def add_song(song_object)
    @songs << song_object if !@songs.include?(song_object)
    song_object.artist = self if song_object.artist != self
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
