require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
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

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.destroy_all
      @@all = []
    end

    def self.create(created_song)
      song = new(created_song)
      song.save
      song
    end

    def self.find_by_name(name)
      all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end

    def self.new_from_filename(name)
     artist, song, genre_name = name.split(' - ') #destructuring, taking the three elements and setting them to variables.
     fixed_name = genre_name.gsub('.mp3', '') #removes .mp3
     artist = Artist.find_or_create_by_name(artist)
     genre = Genre.find_or_create_by_name(fixed_name)
     new(song,artist,genre)
     end

     def self.create_from_filename(file_name)
       new_from_filename(file_name).save
     end

end
