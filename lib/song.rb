require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist

  @@all = []

    def initialize(name, art = nil)
      @name = name
      self.artist=(art) unless art == nil
      #binding.pry
    end

    def artist=(a)
      @artist = a
      # binding.pry
      a.add_song(self) unless a.songs.include?(self)
      # binding.pry
    end


    def self.all
      @@all
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      self.new(name).save
    end

    def self.destroy_all
      @@all.clear
    end

end
