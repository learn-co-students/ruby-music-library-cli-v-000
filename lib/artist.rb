class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs, :song


    @@all = []

    def initialize(name)
      @name = name
      @songs = []
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
    end

    def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
    end

    def add_song(song)
      @songs << song unless @songs.include?(song)
      song.artist = self unless song.artist == self
    end

    def genres
       self.songs.map{|song| song.genre}.uniq
    end

end