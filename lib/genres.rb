require_relative "../Concerns/Findable.rb"
class Genre
   extend Concerns::Findable
   attr_accessor :name
   attr_reader :songs
   
   @@all=[] #all genre instances
   
   def initialize (name)
   @name=name
    @songs=[] #all songs of a genre instance
   end
   
   def self.all 
       @@all  #allows @@all to be accessible
   end
   
   def save  #adds @@all to self
       @@all << self
   end
   
   def self.destroy_all
       @@all.clear #clears @@all
   end
   
   def self.create (name) #creates and saves a new instance of genre
     new_genre=Genre.new(name)
     new_genre.save 
     new_genre
   end
   
  def artists
        @songs.collect do |song| #returns the unique artists of the genre using the list of songs
            song.artist 
                    end.uniq
    end 
    
end