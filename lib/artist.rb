require 'pry'

class Artist
  attr_accessor :name,:songs, :genres

  extend Concerns::Findable
  @@all = []

  def initialize(name,song = nil)
    @name = name
    @songs = []
    # @genres = []
    self.add_song(song) if song == !nil

    self.save
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
    # binding.pry
    a = self.new(name)
    a.save
    a     
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if @songs.include?(song) == false
      self.songs << song
    end
  end

  # def add_genre(genre)
  #   # if @genres.include?(genre) == false
  #     self.genres << genre
  #   end
  # end

  def genres
    self.songs.map{|a| a.genre}.uniq
  end

end
