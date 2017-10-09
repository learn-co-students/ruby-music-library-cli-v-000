class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    detected_song = self.songs.detect{|saved_song| saved_song.name == song.name}
    detected_song == nil ? self.songs << song : nil
  end

  def genres
    collected_genres = @songs.collect{|song| song.genre}.uniq
    collected_genres
  end

end
