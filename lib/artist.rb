require 'pry'

class Artist

    extend Concerns::Findable

attr_accessor :name
attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
     @@all = []
   end

   def save
     @@all << self
   end

   def self.create(name)
     name = self.new(name)
     name.save
     name
   end

   def add_song(song)
     if song.artist != self
     song.artist = self
   end
    if @songs.count(song) == 0
      @songs << song
 end
 end

  def genres
    @songs.collect do |song|
       song.genre
    end.uniq
  end

end
