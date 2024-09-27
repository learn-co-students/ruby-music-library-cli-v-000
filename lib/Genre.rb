class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
    self
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  def add_song(song)
    @songs << song unless @songs.include? song
    song.genre = self unless song.genre == self
  end

  def artists
    artists = @songs.collect{|song| song.artist}.uniq
  end
end
