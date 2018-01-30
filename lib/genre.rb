

class Genre
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
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    genres_artists = []
    self.songs.each do |song|
      genres_artists << song.artist unless genres_artists.include?(song.artist)
    end
    genres_artists
  end

end