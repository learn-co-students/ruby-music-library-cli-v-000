require_relative './concerns/findable.rb'
require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []


    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist != nil
      self.genre = genre if genre != nil
    end

    def save
      @@all << self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end











    ####Class methods ####

        def self.new_from_filename(filename)

          filename_array = filename.split(" - ")
          name = filename_array[1]

          artist = Artist.find_or_create_by_name(filename_array[0])
          genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3", ""))

          song_instance = self.new(name, artist, genre)
          song_instance
        end

        def self.create_from_filename(filename)
          filename_array = filename.split(" - ")
          name = filename_array[1]

          artist = Artist.find_or_create_by_name(filename_array[0])
          genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3", ""))

          song_instance = self.create(name, artist, genre)
          song_instance
        end




    def self.find_by_name(name)
      self.all.detect {|x| x.name == name}
    end

    def self.find_or_create_by_name(name)
      self.all.detect {|x| x.name == name} ? self.all.detect {|x| x.name == name} : self.create(name)

    end


      def self.all
        @@all
      end

      def self.destroy_all
        self.all.clear
      end

      def self.create(name, artist = nil, genre = nil)
        new_instance = self.new(name, artist, genre)
        new_instance.save
        new_instance
      end







end
