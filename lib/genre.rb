class Genre
    extend Concerns::Findable
    attr_reader :songs
    attr_accessor :name
    @@all = []
 
    def initialize(name)
       @name = name
       @songs = []
    end
 
    def save
       @@all.push(self)
    end
 
    def artists
       songs.collect(&:artist).uniq
    end
 
    def self.create(name)
       Genre.new(name).tap(&:save)
    end
 
    def self.all
       @@all
    end
 
    def self.destroy_all
       @@all.clear
    end
 end