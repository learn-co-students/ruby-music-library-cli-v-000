class Genre
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    self.new(name).tap {|genre| genre.save}
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    artist_list = self.songs.collect {|song| song.artist}
    artist_list.uniq
  end
end
