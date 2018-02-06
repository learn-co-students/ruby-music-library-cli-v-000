require 'music_module.rb'

class Genre
  extend MusicModule::ClassMethods
  include MusicModule::InstanceMethods
  
   attr_accessor :destroy_all, :create, :name, :songs
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  @@all = []

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
    genre = Genre.new(name)
    genre.save
    genre
  end

end