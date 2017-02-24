class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all= []

  def initialize(name)
    @name = name
    @songs= []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre= self unless song.genre == self
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
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end

  def to_s
    self.name
  end
end
