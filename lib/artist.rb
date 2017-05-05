class Artist
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :name
@@all = []

#----------------------------------------------------------------------------------------
#instance
def initialize(name)
        @name = name
        @songs = []
end

def save
        @@all << self
end

def songs
        @songs
end

def add_song(song)
        if !@songs.include?(song)
        @songs << song
        end

        if song.artist == nil
        song.artist = self
        end
end




#----------------------------------------------------------------------------------------
#class
def self.all
    @@all
end

def self.destroy_all
    @@all.clear
end

def self.create(name)
    this_artist = self.new(name)
    this_artist.save
    this_artist
    
end



#---
end
