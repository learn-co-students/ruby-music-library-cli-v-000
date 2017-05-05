class Song
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :name, :genre
@@all = []
#----------------------------------------------------------------------------------------
#instance
def initialize(name, artist=nil)
    @name = name
    @artist = artist
    #adds song to artist iff artist was provided at init
    artist.add_song(self) if @artist != nil

    @genre = nil
end

def save
    @@all << self
end


#artist setter/getter w reciprocity to song
def artist= (artist)
# artist.add_song(self)
@artist = artist
        #if its not already added
        artist.add_song(self)
        
        #to add song w/o use of artist #add_song
        # if ! artist.songs.include?(self)
        # artist.songs << self
        # end

end
#---
def artist
@artist
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
