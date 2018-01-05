class Artist
    
    extend Concerns::Findable
    extend Concerns::Listables
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    attr_accessor :name, :song
    
     @@all = []
   
    def initialize(name)
       @name = name
       @songs = []
    end
    
    def songs
        @songs
    end
    
    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.artist = self if song.artist != self
    end
    
    def genres
        self.songs.collect { |song| song.genre }.uniq
    end
    
    def self.all
       @@all 
    end
    
    def self.create(song)
        new_song = Artist.new(song)
        new_song.save
        new_song
    end
    
end