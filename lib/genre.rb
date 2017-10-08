class Genre
  attr_accessor :name, :songs

  @@all=[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
    # binding.pry
  end

  def songs
    @songs
  end

  def artists
    genart = []
    self.songs.each do |song|
      genart << song.artist
    end
    genart.uniq
  end

end
