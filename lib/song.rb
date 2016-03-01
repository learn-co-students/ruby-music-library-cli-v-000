require 'pry'
require_relative '../concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist!= nil
      self.artist = artist
    end
    if genre!= nil
      self.genre = genre
    end
    save
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

  def self.count
    @@all.size
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
  end

  # def self.find_by_name(name)
  #   @@all.detect{|s| s.name==name}
  # end

  # def self.find_or_create_by_name(name)
  #   if !self.find_by_name(name) == name;
  #     create(name)
  #     else
  #   end
  # end

end