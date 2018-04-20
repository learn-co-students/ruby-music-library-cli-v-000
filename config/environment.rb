require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


class Song
attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

 def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

end

class Artist
attr_accessor :name


  def initialize(name)
    @name = name
    @@all = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
     @@all = []
   end

   def save
     @@all << self
   end

   def self.create(name)
     name = self.new(name)
     name.save
     name
   end

end

class Genre
attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
     @@all = []
   end

   def save
     @@all << self
   end

   def self.create(name)
     name = self.new(name)
     name.save
     name
   end

end
