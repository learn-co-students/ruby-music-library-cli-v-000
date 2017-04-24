require_relative '../lib/concerns/memorable'

class Genre

  attr_accessor :name
  attr_reader :songs
  @@all = []

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

end


  #def self.destroy_all
  #  self.all.clear
  #end

  #def save
  #  self.class.all << self
  #end

  #def self.create(name)
  #  genre = self.new(name)
  #  genre.save
  #  genre #add after running rspec 001_song_basics_spec WHAT FOR???
  #end
