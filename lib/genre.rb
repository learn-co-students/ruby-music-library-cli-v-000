class Genre

  extend Concerns::Findable

@@all = []

attr_accessor :name
attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
