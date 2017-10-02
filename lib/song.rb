class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      @artist = artist
      @genre = genre
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.destroy_all
      self.all.clear
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
      genre.add_song(self) unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
      self.all.detect {|n| n.name == name }
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song_name = (filename.split(" - ")[1])
    artist_name = (filename.split(" - ")[0])
    genre_name = (filename.split(" - ")[2].gsub(".mp3", ""))
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

end
