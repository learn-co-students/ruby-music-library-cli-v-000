class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  ### INSTANTIATION METHODS ###
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  ### CLASS METHODS ###
  def self.all
      @@all
  end

  def self.destroy_all
    self.all.clear
  end

  ### INSTANCE METHODS ###
  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
