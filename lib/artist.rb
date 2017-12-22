class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @song = song
    @genre = genre
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
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
        self.songs.detect{|s| s == song} ? nil : @songs << song
    else
      self.songs.detect{|s| s == song} ? nil : @songs << song
    end
  end

  def genres
    collection = []
    @songs.collect{|a| collection << a.genre}
    collection.uniq
  end


  #binding.pry

end
