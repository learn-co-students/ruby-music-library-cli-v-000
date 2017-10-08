require 'pry'
# require_relative '../lib/concerns/findable'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all=[]

  def initialize(name, artist = nil, genre = nil)
    @name=name
    # self.artist=(artist)
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song=Song.new(name)
    song.save
    song
    # binding.pry
  end

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  # def self.find_by_name(name)
  #   self.all.detect {|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name)
  #     self.find_by_name(name)
  #   else
  #     Song.create(name)
  #   end
  # end

end
