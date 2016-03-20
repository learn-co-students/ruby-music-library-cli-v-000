class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre #, :genres
  @@all = []

    def initialize(name, artist = nil, genre = nil)
       @name = name
       self.artist = artist if artist  #Songs and Artists initializing a song with an artist new songs accept an optional argument for the artist
       self.genre = genre if genre #This line makes no impact

    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self) #This line a must.
    end

    def add_song(song)
      song.genre = self unless song.genre == self
      @songs << song unless @songs.include?(song)
    end


    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def new_from_filename(filename)
    end


    def self.create(name, artist = nil, genre = nil)
        new(name, artist = nil, genre = nil).tap {|song| song.save}
    end

    def self.destroy_all
        @@all = []
    end
end
