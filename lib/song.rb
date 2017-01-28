require 'pry'
class Song

attr_accessor :name, :artist
@@all = []


def initialize(name)
  @name = name 
  @artist = artist
end# of initialize


def self.all
  @@all
end# of self.all


def self.destroy_all
  self.all.clear 
end# of self.destroy_all


def save
  self.class.all << self
end# of save 


def self.create(name)
  self.new(name).save
  self
end# of self.create


end# of Song