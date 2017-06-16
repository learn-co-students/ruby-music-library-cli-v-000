class Genre
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    unique_artists = []
    @songs.each {|song| unique_artists << song.artist if !unique_artists.include?(song.artist)}
    unique_artists
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name).tap{|song| song.save}
  end

end
