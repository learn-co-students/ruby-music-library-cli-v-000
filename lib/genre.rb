require_relative '../config/environment.rb'

class Genre
  attr_accessor :name, :songs, :artists
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    self.all << genre
    genre
  end
end
