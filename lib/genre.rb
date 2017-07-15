class Genre
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

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
    unless self.songs.include?(song)
      self.songs << song
    end
    unless song.genre
      song.genre = self
    end
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

end
