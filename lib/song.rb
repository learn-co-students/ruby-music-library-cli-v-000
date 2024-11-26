require 'pry'
class Song
extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_object = nil, genre_object = nil)
          @name = name
          self.artist = artist_object unless artist_object == nil
          self.genre = genre_object unless genre_object == nil
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
        artist.add_song(self)
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

    # def self.find_by_name(filename)
    #   @@all.each do |song|
    #     if song.name == filename
    #     return song
    #     end
    #   end
    #   nil
    # end
    #
    #
    # def self.find_or_create_by_name(name)
    #     if self.find_by_name(name) == nil
    #     self.create(name)
    #     else
    #       self.find_by_name(name)
    #     end
    #   end


  #   def self.create_from_filename(filename)
  #   artist_and_song = filename.split(".")
  #   artist_and_song = artist_and_song.pop(2)
  #   artist_name = artist_and_song.split(" - ")[0]
  #   song_name = artist_and_song.split(" - ")[1]
  #   binding.pry
  #   song = Song.new(song_name)
  #   artist = Artist.new(artist_name)
  #   song.save
  #   song.artist = artist
  #   artist.add_song(song)
  #   song
  # end

  def self.new_from_filename(filename)
      artist_and_song = filename.split(" - ")
      artist_name = artist_and_song[0]
      song_name = artist_and_song[1]
      genre_name = artist_and_song[2].split(".mp3")[0]
      genre = Genre.find_or_create_by_name(genre_name)
      artist = Artist.find_or_create_by_name(artist_name)
      song = self.new(song_name, artist, genre)

  end

  def self.create_from_filename(filename)
  new_from_filename(filename).tap {|song| song.save}
  end

end
