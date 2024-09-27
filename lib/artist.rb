require 'pry'
class Artist
    extend Concerns::Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    attr_accessor :name

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        @songs << song unless @songs.include?(song)
        song.artist = self if song.artist != self
    end

    def songs
        @songs
    end

    def genres
        @songs.collect {|song| song.genre}.uniq
    end

end
