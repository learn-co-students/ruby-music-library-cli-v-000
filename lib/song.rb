class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre


    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      if artist != nil
        self.artist = artist
      end

      if genre != nil
        self.genre = genre
      end

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

    def self.new_from_filename(file_name)
      file = file_name.split(" - ")
      song_name = file[1]
      artist = file[0]
      genre = file[2].chomp('.mp3')

      artist = Artist.find_or_create_by_name(artist)
      genre = Genre.find_or_create_by_name(genre)
      song = Song.find_or_create_by_name(song_name)

      song.genre = genre
      song.artist = artist
      song
    end

    def self.create_from_filename(file_name)
      song = new_from_filename(file_name)
      self.new(song)
    end

end
