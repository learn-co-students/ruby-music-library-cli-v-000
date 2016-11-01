class Artist
  attr_accessor :name, :songs
  @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def add_song(song)
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
  end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      new_name = self.new(name)
      @@all << new_name
      new_name
    end

    def genres
      collected_genres = self.songs.collect do |song|
         song.genre
       end
       collected_genres.uniq
     end

end
