class Genre
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = Genre.new(name)
  end

  def artists
    array = []
    songs.each do |song|
      array << song.artist
    end
    array.uniq
  end

  def save
    @@all << self
  end
end
