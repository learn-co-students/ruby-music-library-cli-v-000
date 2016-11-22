require 'pry'
class Song

  include Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

    def initialize(name, artist = nil, genre = nil)
      @name = name
      self.artist=(artist) unless artist == nil
      self.genre = genre unless genre == nil
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end

    def self.find_by_name(name)
      all.find{|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

    # FROM Song class - ruby advanced class methods lab
    # def self.new_from_filename(filename)
    #   arr = filename.split("-")
    #   arr.each{|element| element.strip!}
    #   title = arr[-1].split(".")
    #   title.pop
    #   arr[-1] = title[0]
    #   new_song = self.new
    #   new_song.name = arr[1]
    #   new_song.artist_name = arr[0]
    #   new_song
    # end

    def self.new_from_filename(filename)
      arr = filename.split("- ")
      arr.each{|element| element.strip!}

      genre = Genre.find_or_create_by_name(arr[-1].split(".").first)
      artist = Artist.find_or_create_by_name(arr[0])

      song = Song.new(arr[1], artist, genre)

    end

    def self.create_from_filename(filename)
      arr = filename.split("- ")
      arr.each{|element| element.strip!}

      genre = Genre.find_or_create_by_name(arr[-1].split(".").first)
      artist = Artist.find_or_create_by_name(arr[0])

      song = Song.new(arr[1], artist, genre).save
    end


    def self.create(name)
      self.new(name).save
    end

    def save
      @@all << self
      self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all.clear
    end

end
