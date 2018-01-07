class Genre
  extend Concerns::Findable
    attr_accessor :name
      @@all = []

      def initialize(name)
        @name = name
        @songs = []
      end

      def save
        @@all << self
      end

      def self.create(name)
        song = Genre.new(name)
        song.save
        song
      end

      def self.all
        @@all
      end

      def self.destroy_all
        @@all = []
      end

      def songs
        @songs
      end

      def add_song(song)
        if song.genre == nil
          song.genre = self
        end
        if !song.genre.songs.include?(song)
          song.genre.songs << song
        end
      end

      def artists
        self.songs.collect {|song| song.artist}.uniq
      end
end
