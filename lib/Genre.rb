require 'pry'
class Genre 
    extend Concerns::Findable
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
        @songs.collect {|song| song.artist}.uniq
    end
end