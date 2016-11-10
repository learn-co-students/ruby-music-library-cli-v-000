class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end

    def save
      @@all << self
    end

    def self.all
      @@all

    end

    def self.destroy_all
      @@all.clear
    end

  #   def to_s
  #   self.name
  # end

    def self.create(name)
      new_song = self.new(name)
      @@all << new_song
      new_song
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def self.new_from_filename(name)

      file_name = name.split(" - ")

      new_file_name = file_name[1].strip
      song = self.new(new_file_name)

      artist_name = file_name[0].strip
      artist = Artist.find_or_create_by_name(artist_name)
      artist.add_song(song)
       song.artist = artist


      genre_name = file_name[2].strip
      new_genre_name = genre_name[0..-5]
      genre = Genre.find_or_create_by_name(new_genre_name)
      genre.add_song(song)
       song.genre = genre

      song
    end

    def self.create_from_filename(name)
      file = self.new_from_filename(name)
        file.save
          file
    end



  end
