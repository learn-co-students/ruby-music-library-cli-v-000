class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

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
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name).tap {|x| x.save}
    genre
  end

  def save
    Genre.all << self
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end
