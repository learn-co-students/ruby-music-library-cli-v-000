require_relative "../Concerns/Findable.rb"
class Artist
  extend Concerns::Findable
   attr_accessor :name, :songs
   
   @@all=[] #artist instances
   
   def initialize (name)
   @name=name
    @songs=[] #songs of each individual artist
   end
   
   def self.all #makes @@all accessible
       @@all
   end
   
   def save  
       @@all << self #adds each instance to the @@all array
   end
   
   def self.destroy_all  #empties the @@alll array
       @@all.clear
   end
   
   def self.create (name)
     new_artist=Artist.new(name) #makes a new_artist instance and saves that to the @@all array
     new_artist.save 
     new_artist
   end
       
    def add_song(song) #adds a new song to the @song array if it is not already there (include?)
        if !@songs.include?(song) 
          @songs << song
          song.artist=self
        end
    end
    
    def genres 
      @songs.collect do |song| #returns the genres (from the songs) of the artist
           song.genre
                    end.uniq
    end
    
    def fullname
        "{songs.artist.name} - #{songs.name} - #{songs.genre.name}"
    end
end