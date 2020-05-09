class Artist

      attr_accessor :name

      @@all = [ ]

      def initialize(name)
         @name = name
         @songs = [ ]
     end

      def self.all
         @@all
     end

      def save
         @@all << self
     end

      def self.destroy_all
         @@all.clear
     end

      def self.create(name)
         artist = Artist.new(name)
         artist.save
         artist
     end

      def songs
         @songs
     end

      def add_song(song)
         if song.artist == nil
             song.artist = self
         end
         self.songs << song unless self.songs.include?(song)
     end

      def genres
         genres = @songs.collect {|song| song.genre}
         genres.uniq
     end

  end
