require 'pry'

class Genre
attr_accessor :name
attr_reader :songs



  def initialize(name)
    @name = name
    @songs = []
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
