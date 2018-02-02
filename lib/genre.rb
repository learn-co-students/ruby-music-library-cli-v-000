class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    #@artist = artist
    #@genre = genre
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save
    genre
  end

  def artists
      @songs.collect {|x| x.artist}.uniq
      #self.songs.collect {|x| x.artist}.uniq
  end

  def add_songs(song)
    @songs << song
    song.genre = self
  end
=begin
  def find_or_create_by_name(name)
    self.all.find {|x| x.name == name} || self.create(name)
    #or returns the first truthey value or the last falsey value. If the first doesnt exist(is falsey) it continues and executes the self.create
  end
=end
end
