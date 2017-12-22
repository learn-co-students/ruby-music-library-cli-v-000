class Genre

  extend Concerns::Findable

  attr_accessor :name, :artist, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def find_song(song)
    self.songs.find{|s| song == song}
  end

  ##
  def add_song(song)
    if song.genre == self
      self.find_song(song) ? nil : @songs << song
    else
      song.genre = self
      self.find_song(song) ? nil : @songs << song
    end
  end

  def artists
    collection = []
    @songs.collect{|s| collection << s.artist}
    collection.uniq
  end

  #binding.pry


end
