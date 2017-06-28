class Genre
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def self.all
    @@all.sort_by!{|a| a.name} 
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
  end

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

  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
