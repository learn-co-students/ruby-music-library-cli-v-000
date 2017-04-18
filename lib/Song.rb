require 'pry'

class Song
  attr_accessor :artist, :name, :genre
  extend Concerns::Findable

    @@all = []

    def initialize(name)
      @name = name
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

    def save
      @@all << self
      self
    end

    def self.create(name)
      song = self.new(name)
      song.save
      song
    end

    # def artist=(artist)
    #   @artist = artist
    # end

    # def artist_name=(name)
    #   self.artist = Artist.find_or_create_by_name(name)
    # end


    # def self.new_by_filename(filename)
    #   song_name = filename.split(" - ")[1]
    #   song_artist = filename.split(" - ")[0]
    #
    #   song = Song.new(song_name)
    #   song.artist_name=(song_artist)
    #   song.save
    # end
    # 
    # def self.new_by_name(name)
    #   song = self.new
    #   song.name = name
    #   song
    # end
    #
    # def self.create_by_name(name)
    #   song = self.create
    #   song.name = name
    #   song
    # end
    # #the .create method saves the song to the @@all array
    #
    # def self.find_by_name(name)
    #   @@all.detect{|song| song.name == name}
    # end
    #
    # def self.find_or_create_by_name(name)
    #   self.find_by_name(name) || self.create_by_name(name)
    # end
    #
    # def self.alphabetical
    #   @@all.sort_by { |word| word.name }
    # end
    #
    # def self.new_from_filename(filename)
    #   song = Song.new
    #   new_song = filename.split("-") #splits the string at the hyphen
    #   song.artist_name = new_song[0].strip #assigns the stripped first element to variable
    #   song.name = new_song[1].split(".")[0].strip #splits element at period, strips first element, deletes mp3
    #   song #returns new song
    # end
    #
    # def self.create_from_filename(filename)
    #   song = Song.new
    #   new_song = filename.split("-")
    #   song.artist_name = new_song[0].strip
    #   song.name = new_song[1].split(".")[0].strip
    #   song.save
    # end

  end
