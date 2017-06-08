
require 'pry'
include Concerns::Findable
class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist = artist unless artist == nil
      self.genre = genre unless genre == nil
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
      new(name).tap{|s| s.save}
      #binding.pry
    end

    def add_song(song)
      @songs << song unless song.artist == self
      song.artist = self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def self.find_by_name(name)
      self.all.detect {|objekt| objekt.name == name}
    end

    def self.new_by_name(name)
      self.new(name)
    end

    def self.find_or_create_by_name(name)
      self.name != name
      self.find_by_name(name) ? self.find_by_name(name) : self.new_by_name(name).tap{|s| s.save}
    end

    def self.new_from_filename(file)
      #binding.pry
      file = file.split(" - ")
      artist = file[0]
      song = file[1]
      genre = file[2].gsub(".mp3", "")
      #binding.pry
      new_song = self.new_by_name(song)
      new_song.artist = Artist.find_or_create_by_name(artist)

      new_song.artist.add_song(new_song)
      new_song.genre = Genre.find_or_create_by_name(genre)
      new_song.genre.add_song(new_song)
      new_song #want to use tap here
      end

      def self.create_from_filename(file)
        self.new_from_filename(file).tap{|s| s.save}
#          @@all << self.new_from_filename(file)
#          self.new_from_filename(file)
#
#       end
      end
# #
# #
# #
end
#     #Song.new("Gold and Silver", "Stavesacre")
#     #binding.pry
