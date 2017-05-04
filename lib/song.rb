class Song
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :name, :genre, :artist
@@all = []
#----------------------------------------------------------------------------------------
#instance
def initialize(name)
    @name = name
end

def save
    @@all << self
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
    this_song = self.new(name)
    this_song.save
    this_song
end



#---
end
