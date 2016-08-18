require "pry"
class Song

  attr_accessor :name
  attr_reader :artist


    @@all = []

    def artist= (artist)
      #binding.pry
      @artist = artist
      #binding.pry
      self.artist.add_song(self)
      #self.artist.songs.push(self)

    end

    def initialize(name, artist=nil)
      #binding.pry
      self.artist= artist if artist
      @name = name
      #binding.pry

    end


    def self.all
      @@all
    end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

end
#binding.pry
