require 'bundler'
Bundler.require

module Concerns
  module Findable
      attr_accessor :name

      def initialize(name)
        @name = name
        @@all = []
      end

      def save
        @@all << self
      end

      def all
        @@all
      end

      def create(name)
        self.new(name).tap {|x| x.save}
      end

      def find_by_name(name)
        self.all.detect do |instance|
          instance.name == name
        end
        #returns instance
      end

      def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
      end

      def destroy_all
        @@all = []
      end

  end #findable
end #concerns

class Artist
  include Concerns::Findable
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    self.songs.each do |tune|
      genres << tune.genre unless genres.include?(tune.genre)
    end
    genres
  end

end

class Song
  include Concerns::Findable
  extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :artist, :genre

  def initialize(name, artist="", genre="")
    @name = name
    @songs = []
    @artist = artist unless artist == ""
    @genre = genre unless artist == ""
    artist.songs << self unless artist = ""
    genre.songs << self unless genre = ""
  end

  def artist=(art)
    @artist = art
    art.add_song(self) unless art.songs.include?(self)
  end

  def genre=(gen)
    @genre = gen
    gen.songs << self unless gen.songs.include?(self)
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    art = find_or_create_by_name(array[0])
    gen = find_or_create_by_name(array[2][0..-5])
    new_song = self.find_or_create_by_name(array[1])
    new_song.artist = art
    new_song.genre = gen
    new_song

=begin
    #song= array[1]
    #artist= array[0]
    #genre= array[2][0..-5]
=end
  end

end

class Genre
  include Concerns::Findable
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(name)
    super
    @songs = []
  end

  def add_song(song)
    if song.genre == self
    else
      song.genre = self
    end  
    
    if @songs.include?(song) == true
    else
      @songs << song
    end
  end

  def artists
    artist = []
    self.songs.each do |tune|
      artist << tune.artist
    end
    artist.uniq
  end
end

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    directories = Dir.entries(@path)
    directories.delete(".")
    directories.delete("..")
    directories
  end

end

require_all 'lib'
