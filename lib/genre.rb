class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name) # tap method?
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.map{ |song| song.artist }.uniq
  end

end