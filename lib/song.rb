
require_relative './concerns/findable_module.rb'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if !! artist
      self.artist = artist
      artist.songs << self if !artist.has_song?(self)
    end

    if !!genre
      self.genre = genre
      artist.genres << self.genre if !genre.exists?
    end
  end

  # def self.find_by_name(name)
  #   self.all.detect{|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.has_song?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).save
  end



  # def self.create(name)
  #   self.new(name).tap do |new_song|
  #     if !self.all.detect {|song| song.name == name}
  #       new_song.save
  #     end
  #   end
  # end

end
