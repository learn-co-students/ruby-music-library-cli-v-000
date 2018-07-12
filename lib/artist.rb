class Artist
  extend Concerns::Findable::ClassMethods
  attr_accessor :name
  @@all = []

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
    created_artist = Artist.new(name)
    @@all << created_artist
    created_artist
  end

  def add_song(song_instance)
    song_instance.artist = self if song_instance.artist != self
    @songs << song_instance unless @songs.include?(song_instance)
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
