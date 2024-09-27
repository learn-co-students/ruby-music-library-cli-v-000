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
   unless @@all.include? self
     self.class.all << self
   end
  end

  def self.create(genre_name)
    genre = self.new(genre_name)
      genre.name = genre_name
      genre.save
      genre
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end


end
