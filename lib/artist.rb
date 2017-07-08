class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  	def initialize(name)
  		@name = name
      @songs = []
  	end

    def self.create(name)
      #why does this work?
      #what is new(name) doing?
      new(name).tap {|art| art.save}
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def add_song(song)
      song.artist = self unless song.artist == self
      @songs << song unless @songs.include?(song)
    end

    def genres
      self.songs.collect {|song| song.genre}.uniq
    end

    def to_s
      self.name
    end

    def save
      @@all << self
    end
end
