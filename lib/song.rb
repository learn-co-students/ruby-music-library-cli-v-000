require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_song_instance = self.new(name)
    self.all << new_song_instance
    new_song_instance
  end

  def self.destroy_all
    self.all.clear
  end

  def artist=(artist)
    @artist = artist
    if artist.class == String
      artist_instance = Artist.new(artist)
      artist_instance.add_song(self)
      @artist = artist_instance
    elsif artist.class == Artist
      artist.add_song(self)
      @artist = artist
    end
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if genre.class == String                    #    "dance"
      genre_search_result = Genre.all.detect {|saved_genre_instance| saved_genre_instance.name == @genre}
      if genre_search_result != nil
        @genre = genre_search_result
      else
        new_genre_instance = Genre.new(@genre)
        @genre = new_genre_instance
      end
      if @genre.songs.include?(self) == false
        new_genre_instance.songs << self
      end
    elsif genre.class == Genre
      if genre.songs.include?(self) == false
        genre.songs << self
        @genre = genre
      end
    end
  end


  def self.new_from_filename(file_name)
    song_info = file_name.split(" - ")
    @artist = song_info[0]
    @name = song_info[1]
    @genre = song_info[2].split(".")[0]
    song_instance = self.new(@name, @artist, @genre)
    #binding.pry
  
  end

end
