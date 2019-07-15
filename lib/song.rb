require 'pry'

class Song
  attr_accessor :name, :artist
  # attr_reader :artist

  @@all = []

  def initialize(name, artist = '')
    @name = name
    @artist = artist
    artist=(artist)
  end

  # def initialize(options = {})
  #         self.name = options[:name] || ''
  #         self.age = options[:age] || 0
  #     end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end
