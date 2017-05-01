require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def add_song(song_name)
    if song_name.artist.nil?
      song_name.artist = self
    end
    self.songs << song_name unless self.songs.include?(song_name)
  end

  def genres
    genres = []
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.each {|genre| genres << genre unless genres.include?(genre)}
    genres
  end

end
