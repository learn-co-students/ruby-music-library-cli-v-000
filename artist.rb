require 'pry'
class Artist

  attr_accessor :name, :song
   @@all = []

   #peter = Artist.new("peter")  How we create a new artist.
    #<Artist:0x00000000ce4cd0 @name="peter", @songs=[]>
    def initialize(name)
      @name = name
      @songs = [ ]
       #peter.song = ("pit")  How to attribute song to the artist after the artist is create.
    end

    def songs
      @songs
    end

    def save
      @@all << self  # refers to the class artist to save the songs when created
    end

    def self.all # show all song artist ever created.
      @@all
    end

    def add_song(song)
      @songs << song
    #   song.artist = self
    #   @@song_count = @@song_count + 1
    #  #  or # @@song_count +1
    end
  end
