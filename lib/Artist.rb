require 'pry'

class Artist
  attr_accessor :name, :songs, :genre
  extend Concerns::Findable

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
    self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  # def add_song(song)
  #   @songs << song
  #   @genres << song.genre
  #   song.genre.artists << self
  # end

  # def genres
  #   self.songs.collect do |song|
  #     song.genre
  #   end
  # end



  # def add_songs(songs)
  #   songs.each { |song| add_song(song) }
  # end
  #
  # def songs
  #   @songs
  # end
  #
  # def artists
  #   @songs.collect do |song|
  #     song.artist
  #   end
  # end

  def self.find_or_create_by_name(name)
    self.all.detect do |artist_obj|
      artist_obj.name == name
    end || Artist.new(name).save
    #Artist.create creates the instance of the class and saves it
    #A new create method would be needed for Artist.create to work
  end

  # def print_songs
  #   songs.select { |song| puts song.name }
  # end



  # class Artist
  #   extend Memorable::ClassMethods
  #   extend Findable::ClassMethods
  #   include Memorable::InstanceMethods
  #   include Paramable::InstanceMethods
  #   attr_accessor :name
  #   attr_reader :songs
  #
  #   @@artists = []
  #
  #   # def self.find_by_name(name)
  #   #   @@artists.detect{|a| a.name == name}
  #   # end
  #
  #   def initialize
  #     super
  #     @songs = []
  #   end
  #
  #   def self.all
  #     @@artists
  #   end
  #
  #   # def self.reset_all
  #   #   self.all.clear
  #   # end
  #
  #   # def self.count
  #   #   @@artists.count
  #   # end
  #
  #   def add_song(song)
  #     @songs << song
  #     song.artist = self
  #   end
  #
  #   def add_songs(songs)
  #     songs.each { |song| add_song(song) }
  #   end
  #
  #   # def to_param
  #   #   name.downcase.gsub(' ', '-')
  #   # end
  #
  # end


end
