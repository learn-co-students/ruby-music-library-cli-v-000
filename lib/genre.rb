class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

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

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre 
  end

  def artists
    self.songs.map {|song| song.artist}.uniq
  end
end
