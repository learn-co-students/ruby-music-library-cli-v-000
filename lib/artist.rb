require 'pry'

class Artist
  attr_accessor :name, :songs

  @@all = []

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods
  extend Concerns::Findable

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def add_song(song_name)
    if song_name.artist.nil?
      song_name.artist = self
    end
  end

  def genres
    genres = []
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.each {|genre| genres << genre unless genres.include?(genre)}
    genres
  end

end
