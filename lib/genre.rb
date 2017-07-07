class Genre

extend Concerns::Findable

    attr_accessor :name, :songs, :artist

    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def save
      @@all.push(self)
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      genre= self.new(name)
      genre.save
      genre
    end

    def add_song(song)
      if !(@songs.include?song)
        @songs.push(song)
        song.genre = self
    end
  end

  def artists
    collection_array= @songs.collect{|song| song.artist}.uniq
    collection_array
  end



end
