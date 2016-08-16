
class Artist
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
    super
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    genre_array = @songs.collect do |song|
    song.genre
    end
    genre_array.uniq
  end

 
end