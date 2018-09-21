require '../config/environment'

class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @songs = []
    @name = name
    @@all << self
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
    self.new(name)
  end

  # why didn't this work:

  # def add_song(song)
  #     if self.songs.include?(song)
  #     elsif !self.songs.include?(song) && song.artist == nil
  #       song.artist = self
  #       self.songs << song
  #     elsif !self.songs.include?(song) && song.artist != nil
  #       self.songs << song
  #     end
  # end


  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
     genre_array = self.songs.collect do |song| song.genre
    end
    genre_array.uniq
  end




end
