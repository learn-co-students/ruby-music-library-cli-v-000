require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end

  def self.all
    @@all
    # binding.pry
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = new(name)
    s.save
    s
  end

  def self.find_by_name(name)
    @@all.select { |name| name.include? }
  end

  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s = nil
      self.create(name)
    else
      s
    end
  end

end
