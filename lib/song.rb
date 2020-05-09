class Song

      attr_accessor :name
     attr_reader :artist, :genre

      @@all = [ ]

      def initialize(name, artist = nil, genre = nil)
         @name = name
         self.artist=(artist) if artist
         self.genre=(genre) if genre
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
         song = Song.new(name)
         song.save
         song
     end

      def artist=(artist)
         @artist = artist
         artist.add_song(self)
     end

      def genre=(genre)
         @genre = genre
         genre.songs << self unless genre.songs.include?(self)
     end

      def self.new_from_filename(filename)
         artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
         name = filename.split(" - ")[1]
         genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
         Song.new(name, artist, genre)
     end

      def self.create_from_filename(filename)
        song = new_from_filename(filename)
        song.save
     end

  end
