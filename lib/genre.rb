class Genre
  #extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable
  #include Paramable::InstanceMethods 

  attr_accessor :name, :songs
    #This was in a class module but created issues with the import method
   @@all = []

    def self.all
      @@all
    end
    
     def self.destroy_all
     self.all.clear
     end
  #--------------------------------

  def initialize(name)
    @name = name
    @songs = []
  end

def artists
  artist_array = @songs.collect do |song|
  song.artist
  end
  artist_array.uniq!
end
 
end