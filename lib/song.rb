class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_object = nil, genre_object = nil)
      @name = name
      @artist = artist
      @genre = genre
          self.artist = artist_object unless artist_object = nil
          self.genre = genre_object unless genre_object = nil
      end

      def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
      end


      def genre
        @genre
      end


  def artist=(artist)
        @artist = artist
        artist.add_song(self) unless artist.songs.include?(self)
  end


  def artist
    @artist
  end

    def save
      @@all << self
    end

    def self.create(name)
      song = Song.new(name)
      @@all << song
      song
      end

    def self.all
    @@all
    end

    def self.destroy_all
      @@all.clear
    end

end
