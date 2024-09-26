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
    self
  end

  def songs
    @songs
  end

  def genres
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.uniq {|genre| genre}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Artist.new(name).save
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if (!songs.include?(song))
  end
end
