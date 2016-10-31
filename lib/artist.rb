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
      self.songs.uniq do |song|
      song.genre
        #  binding.pry
       end
     end

end
