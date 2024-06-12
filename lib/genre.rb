require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class Genre

  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable
  extend Concerns::Findable::ClassMethods
  include Concerns::Findable::InstanceMethods

  attr_accessor :name, :song, :genre, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end

    if song.genre == nil || song.genre == ''
      song.genre = self
      artist.genre = self
    end
  end

  def artists
    @artists = []
    self.songs.each do |song|
      if !@artists.include?(song.artist)
        @artists << song.artist
      end
    end
    @artists
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
