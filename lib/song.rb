class Song
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :name
@@all = []
extend Concerns::Findable
#----------------------------------------------------------------------------------------
#instance
def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    #adds song to artist iff artist was provided at init
    
    artist.add_song(self) if @artist != nil
    
    if genre != nil
        @genre = genre
        
        if ! genre.songs.include?(self)
            genre.songs << self
        end
    end

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

def artist
@artist
end


def genre
        @genre
end


def genre= (genre)
        @genre = genre
        if !genre.songs.include?(self)
            genre.songs << self
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
    this_song = self.new(name)
    this_song.save
    this_song
end

def self.new_from_filename(filename)
  
    new_song = self.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[1])
  
    new_song.genre = Genre.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[2])
 
    new_song.artist = Artist.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[0])
new_song

end


def self.create_from_filename(filename)
  
    new_song = self.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[1])
  
    new_song.genre = Genre.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[2])
 
    new_song.artist = Artist.find_or_create_by_name(filename.chomp(".mp3").split(" - ")[0])
new_song

end
#---
end
