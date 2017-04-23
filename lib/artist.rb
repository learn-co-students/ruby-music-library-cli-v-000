class Artist
   extend Memorable::ClassMethods
   include Memorable::InstanceMethods

   extend Concerns::Findable

   attr_accessor :name, :songs

   @@all = []

   def self.all
     @@all
   end

   def initialize(name)
     @name = name
     @songs = []
   end

   def add_song(song)
    if !@songs.detect {|songs| songs.name == song.name}
      @songs << song
      if song.artist ==nil
        song.artist = self
      end
     end
   end

   def genres
     @songs.collect {|song| song.genre}.uniq
   end
end
