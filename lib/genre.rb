class Genre
  attr_accessor :name, :songs
  
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
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

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

end
