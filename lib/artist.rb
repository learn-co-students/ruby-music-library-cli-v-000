require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs
   @@all = []

   #peter = Artist.new("peter")  How we create a new artist.
    #<Artist:0x00000000ce4cd0 @name="peter", @songs=[]>
    def initialize(name)
      @name = name
      @songs = [ ]
       #peter.song = ("pit")  How to attribute song to the artist after the artist is create.
    end

    def artist
      @artist
    end

    def save
      @@all << self  # refers to the class artist to save the songs when created
    end

    def self.all # show all song artist ever created.
      @@all
    end

    def add_artist(artist)
      @artist << artist

    end

    def self.destroy_all
          @@all.clear
    end

    def self.create(name)
         artist = Artist.new(name)
         artist.save
         artist
    end

    def add_song(song)
      song.artist = self if song.artist != self
      @songs << song unless @songs.include?(song)  #unless song included in our collection.x
    end

    def genres
        # @songs.collect do |song|
        @songs.collect{ |song| song.genre}.uniq
        #song.genre # artist has many genre through songs.
    end

    def self.find_by_name(name)
         self.all.find {|x| x.name == name}
    end

    def self.find_or_create_by_name(name)
      #turn class string into an objects
      # This is where we chain things togther
       if self.find_by_name(name)
          self.find_by_name(name)
       else
         self.create(name)
       end
     end

  end
