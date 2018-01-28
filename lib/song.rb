require 'pry'
require_relative "../config/environment.rb"

class Song

  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist_instance = nil, genre_instance = nil)
    @name = name
    self.artist = artist_instance
    self.genre = genre_instance
  #  binding.pry
    self.save
  end

  def artist=(artist_instance)
    if artist_instance != nil
      @artist = artist_instance
      @artist.add_song(self)
    end
  end

  def genre=(genre_instance)
    if genre_instance != nil
      @genre = genre_instance
      if @genre.songs.include?(self) == false
      @genre.songs << self
      end
    end
  end


  def save
    if !@@all.include? self
      @@all << self
    end
  end

  def self.create(name)
    self.new(name)
  end

  def self.new_from_filename(file_name)
  # binding.pry
    song_instance = self.find_or_create_by_name(file_name.split(" - ")[1])
    song_instance.artist  = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    song_instance.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].chomp".mp3")
    song_instance
  end

 def self.create_from_filename(file_name)
   song_instance = self.new_from_filename(file_name)
   song_instance.save
 end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def genre
    @genre
  end

  # def self.find_by_name(name)
  #   @@all.detect do |each_name|
  #     each_name.name == name
  #   end
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) == nil
  #     self.create(name)
  #   else
  #     self.find_by_name(name)
  #   end
  # end
end
