class Genre
    
    extend Concerns::Findable
    extend Concerns::Listables
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    attr_accessor :name
   
    def initialize(name)
       @name = name
       @songs = []
    end
    
    def songs
        @songs    
    end
    
    def artists
        self.songs.collect { |song| song.artist }.uniq    
    end
    
    def self.all
       @@all 
    end
    
    def self.create(song)
        new_song = Genre.new(song)
        new_song.save
        new_song
    end
    
end