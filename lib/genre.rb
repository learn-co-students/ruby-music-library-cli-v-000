class Genre
  extend Concerns::CommonUtil
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.genre ||= self
    @songs << song unless @songs.include? song
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

  def save
    Genre.all << self
    self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
  end

  def self.all
    @@all
  end

  #def self.destroy_all
  #  self.all.clear
  #end
end