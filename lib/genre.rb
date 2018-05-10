class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    Genre.all << self
  end

  def self.destroy_all
    Genre.all.clear
  end

  def self.create(name)
    Genre.new(name).tap {|genre| genre.save}
  end

  def add_song(song)
    song.genre ||= self
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end
end
