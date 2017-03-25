class Genre

    extend Concerns::Findable
    extend Persistable::ClassMethods

    include Persistable::InstanceMethods

    attr_accessor :name, :songs

    def initialize(name)
      @name=name
      @songs = []
    end

    def self.all
      @@all
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

    def add_song(song)
      @songs << song if !self.songs.include?(song)
      song.genre = self if !song.genre
    end

    def artists
        self.songs.collect { |a| a.artist }.uniq
    end


end
