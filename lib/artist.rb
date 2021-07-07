require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end

  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end

end
