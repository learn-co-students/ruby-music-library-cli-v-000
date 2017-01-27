require 'pry'
class Song
  extend Concerns::Findable
attr_accessor :name 
@@all = []

def initialize(name)
  @name = name 
end# of initialize


def self.all
  @@all
end# of self.all

def self.destroy_all
  self.all.clear 
end# of self.destroy_all


def save
  @@all << self
end# of save 


def self.create(name)
  song = self.new(name).save 
  #binding.pry 
end# of self.create

end# of Song