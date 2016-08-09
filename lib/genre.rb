class Genre
  attr_accessor :name
  attr_reader :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    @songs.each do |song|
      @artists << song.artist
    end
    @artists
  end




end