class Artist
  attr_accessor :name
  @@all = []
  extend Concerns::Findable


  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    genres = self.songs.map do |x| x.genre
    end
    genres.uniq
  end

  def add_song(song_name)
    song_name.artist = self if song_name.artist == nil
    @songs << song_name unless @songs.include?(song_name)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
    @@all
  end

  def self.create(new_name)
  new_artist = self.new(new_name)
  @@all << new_artist
  new_artist
  end

  def self.all
    @@all
  end



end
