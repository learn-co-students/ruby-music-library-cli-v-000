class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class methods



  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  #Instance Methods

  def save
    @@all << self
  end

  def add_song(song)
    song.genre = self if !song.genre
    @songs << song unless @songs.include?(song)
  end

  def artists
    @songs.collect {|song| song.artist }.uniq
  end




end
