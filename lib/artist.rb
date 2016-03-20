class Artist
   extend Concerns::Findable

  attr_accessor :name, :genre, :genres, :songs #, :song,
  @@all = []

    def initialize(name, song=nil, genre=nil)
        @name = name
        @songs = []
        @genres = []
    end

    def genre
       self.songs.collect do |song|
         song.genre #.artist #= self
       end
    end
     #       song.genre
    def genres
       self.songs.collect do |song|
     #       song.genre.uniq #.uniq  #comment out uniq
#             @genres << song.genre #.uniq
            @songs << song.genre.uniq
       end
    end

#     def genres
#         @genres
#     end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_song(song)
       @song = song
       song.artist = self unless song.artist == self
      # song.artist = self unless song.artist == self
       @songs << song unless @songs.include?(song)
    end

    def self.create(name, song=nil, genre=nil)
      new(name, song=nil, genre=nil).tap {|artist| artist.save}
    end

    def self.destroy_all
        @@all = []
    end
end
