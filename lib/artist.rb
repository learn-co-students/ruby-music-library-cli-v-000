class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
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
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    genre_list = self.songs.collect {|song| song.genre}
    genre_list.uniq
  end
end
