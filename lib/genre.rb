class Genre
  extend Concerns::Findable
  extend Concerns::Createdestroy
  include Concerns::Save
  attr_accessor :name, :songs, :artists

  def initialize(name)
    @name = name
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
    genre_name = self.new(name)
    genre_name.save
    genre_name
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end
