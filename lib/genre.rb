class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  #attr_reader :songs

  @@all = []

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
    #self.new(name).save[0]
    genre = new(name)
    genre.save
    genre
  end

  def artists
    artist_array = []
    @songs.collect do |song|
      artist_array << song.artist unless artist_array.include?(song.artist)
    end
    artist_array
  end
  #   songs.collect{ |s| s.artist }.uniq
  # end
end
