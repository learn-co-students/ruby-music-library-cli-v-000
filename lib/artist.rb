class Artist 
  
    extend Concerns::Findable
    # extend Concerns::ClassMethod
    
    attr_accessor :name, :song
    
     @@all = []
    
    def initialize(name)
      @name = name
      # @@all = []
      @songs = []
    end 
    
    def self.all
      @@all
    end
    
    def self.destroy_all
      @@all.clear
    end
    
    def save
      @@all << self
    end
    
    def self.create(name)
      artist = self.new(name)
      artist.save
      artist
    end
    
    def songs
      # Song.all.select {|song| song.artist == self }
     @songs
    end
    
    # ---------------------------------------------------
      # def add_song(song)
      # song.artist = self if !song.artist
      # songs << song if !songs.include?(song)
      # end
    
    def add_song(song)
      song.artist = self if song.artist != self
      songs << song if songs.include?(song) == false
    end
    
    # ---------------------------------------------------
    
    
    #   Artist#genres
    #   returns a collection of genres for all of the artist's songs (artist has many genres through songs) (FAILED - 1)
    
    #   does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs) (FAILED - 2)
    
    #   collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
    
    def genres
      songs.map {|song| song.genre}.uniq
    end
    
    # ---------------------------------------------------

    def self.find_or_create_by_name(name)
      
      artist = self.find_by_name(name)
      return artist if artist 
      artist = self.create(name)
      
    end

    # ---------------------------------------------------

    
end 