class Genre
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

#songs getter
def songs
@songs
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
    this_genre = self.new(name)
    this_genre.save
    this_genre
end



#---
end
