require 'pry'
class Artist
  extend Concerns::Findable
   @@all = []
  attr_accessor :name
  attr_reader :songs, :genres
  def initialize(name)
    @name = name
    @songs = []

  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
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
#Relationships
    def add_song(song)
          if song.artist == nil
             song.artist= self
          end
          if !@songs.include?(song)
              @songs << song
          end
    end
  def genres
        @songs.map { |e| e.genre}.uniq    #the program ask the object not the names
  end
end
