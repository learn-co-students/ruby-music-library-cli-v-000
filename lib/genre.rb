class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all=[]
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre=new(name)
    new_genre.save
    new_genre
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end
