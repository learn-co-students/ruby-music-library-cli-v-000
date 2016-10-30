require "pry"
class Song
    include Concerns::Findable
    extend Concerns::ClassMods

    attr_accessor :name
    attr_reader :artist


    @@all = []

    def initialize(n, artist=nil)
        super
        artist=(artist)
    end

    def self.all
        @@all
    end

    def artist=(artist)
        if @artist.nil?
            @artist = artist
            artist.add_song(self)
        end
        binding.pry
    end

end
