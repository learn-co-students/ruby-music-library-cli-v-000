class Song

    extend Concerns::Findable
    attr_accessor :name, :genre, :artist

    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def save
      song = Song.new(name)
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create(name)
      song = Song.new(name)
      song.save
      song
    end

    def self.destroy_all
      @@all.clear
    end

    def artist=(artist)
      @artist = artist
      #binding.pry
      @artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      #binding.pry
      @genre.add_song(self)
    end

    def self.new_from_filename(filename)
      data = filename.split(" - ")
      song_name = data[1]
      artist_name = data[0]
      genre_name = data[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
      data = filename.split(" - ")
      song_name = data[1]
      artist_name = data[0]
      genre_name = data[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      song = Song.create(song_name)
      song.artist = artist
      song.genre = genre
      song
    end


end
