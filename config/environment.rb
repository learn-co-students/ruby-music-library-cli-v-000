require 'bundler'
Bundler.require

require_all 'lib'


module Concerns
  module Findable 
     def find_by_name(name)
     all.find do |song|
        song.name == name
        end
      end
    
     def find_or_create_by_name(name)
       find_by_name(name) || create(name)
      end
  end 
end


class MusicImporter
  attr_accessor :path 
  @@all = []
  
    def initialize(path)
      @path = path
      @@all << self 
    end 
    
    # literally NO idea what's going on here... regex, it looks like? 
    # tried for like 30 mins, gave up, googled
    def files 
       @files ||= Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end
  
    def import
      files.each do |song|
         Song.create_from_filename(song)
       end 
    end 
end 


class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path="./db/mp3s")
    @path = path 
    new_MusicImporter_object = MusicImporter.new(path)
    new_MusicImporter_object.import
  end 
  
  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

    case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end 
  end

    
  def list_songs
      songs_sorted = Song.all.sort_by do |song|
        song.name
      end
      songs_sorted.each.with_index(1) do |song,index|
        puts "#{index}." + " " + "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
    
    
end


class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  
    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
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
      self.new(name).tap do |song|
        song.save
        end 
      end 
      
    def artist=(artist)
      if @artist == nil
        @artist = artist
        else
          @artist = @artist
        end
      if self.artist != nil
        @artist.add_song(self)
        end
      @artist
     end 
    
    def genre=(genre)
      if @genre == nil
        @genre = genre
      else
        @genre= @genre
      end
      if self.genre != nil
        @genre.add_song(self)
      end
      @genre
    end

    def genre
      @genre
    end
      
    def self.find_by_name(name)
     @@all.find do |song|
        song.name == name
      end
    end
    
    def self.find_or_create_by_name(name)
     self.find_by_name(name) || self.create(name)
    end
    
    def self.new_from_filename(name)
      song_name = name.split(" - ")[1]
      artist_name = name.split(" - ")[0]
      genre_name = name.split(" - ")[2].chomp(".mp3")
    
      song = self.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)

      song
    end
    
    def self.create_from_filename(name)
      @@all << self.new_from_filename(name)
    end 
    

end 



class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genre
  @@all = []
  
  
    def initialize(name)
      @name = name
      @songs = []
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
      self.new(name).tap do |artist|
        artist.save
        end 
      end 
      
    def add_song(song) 
      song.artist = self unless
       song.artist == self
        @songs << song unless @songs.include?(song)
      end 
      
     def genres
        genres = @songs.collect do |song|
         song.genre
        end
        genres.uniq
      end
    
end


class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
      def initialize(name)
        @name = name
        @songs = []
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
        self.new(name).tap do |genre|
        genre.save
        end 
      end 
    
      def add_song(song) 
        song.genre = self unless
         song.genre == self
          @songs << song unless @songs.include?(song)
        end 
  
       def artists
        artists = @songs.collect do |song|
         song.artist
        end
        artists.uniq
      end
  
end 






