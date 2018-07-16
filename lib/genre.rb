class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
