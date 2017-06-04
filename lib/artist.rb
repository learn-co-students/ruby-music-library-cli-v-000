class Artist
    extend Concerns::Findable
     @@all = []
    attr_accessor :name, :songs
    
    def initialize(name)
        @name = name
        @songs = []
    end

    def genres
        collection = self.songs.collect{ |song|
                        song.genre
                    }
        collection.uniq
    end
    

    def add_song(song)
# does not add the song to the artist's song collection if the artist already has the song
    if !self.songs.include?(song)
        self.songs << song  
    end
#binding.pry
#iterate through Song.all for song. 
# .     if song exists without an artist, add artist to that song
#      # automatic if song exists and already has artist, do nothing
# .     if song doesn't exist add to Song.all (with artist -self added) 

        collection = Song.all.collect{|a_song|
                        if a_song == song && a_song.artist.nil?
                           a_song.artist = self
                        end
                      }
        if collection.empty?
            song.save
            if song.artist.nil?
                song.artist = self
            end
        end
#binding.pry

    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        self.new(name).tap{ |artist|
            artist.save
        }
    end
end