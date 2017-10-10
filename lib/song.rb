require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end


    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
    end

    def self.create(name)
      song = Song.new(name)
      song.save
      song
    end

    def self.find_by_name(name)
      self.all.detect{|s| s.name == name }
    end


    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
end
  #
  # def self.new_from_filename(name)
  #    song = self.new
  #    song.name = name
  #    song
  # end
  #
  # def self.create_from_filename
  #   song = self.create
  #   song.name = name
  #   song
  # end
  #
  #
  # def self.find_by_name
  #   self.all.detect {|song| song.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name || self.create_by_name(name)
  # end
  #
  #
  #
  # def artist_name=(name)
  #   if (self.artist.nil?)
  #     self.artist = Artist.new(name)
  #   else
  #     self.artist.name
  #   end
  # end
  # # @artist = artist unless @artist
  # # artist.add_song(self) unless artist.song.include?(self)
  #
  # def artist=
  #   artist.add_song
  # end
  #
  # def genre=(genre)
  # end
