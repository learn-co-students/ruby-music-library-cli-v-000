class Artist
    attr_accessor :name, :songs

    include Concerns::Basics
    extend Concerns::Findable

    @@all = []

    def initialize(n)
        super
        @songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        if !self.songs.include?(song)
            @songs << song
            song.artist=self
        end
    end

    def genres
      @songs.collect{|song| song.genre}.uniq
    end


    # def add_genre(genre)
    #   if !self.genres.include?(genre)
    #     @genres<<genre
    #   end
    # end

end
