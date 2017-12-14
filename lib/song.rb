require 'pry'

# create class Song
class Song 
# create attr_accessor for name
  attr_accessor :name 
# create @@all = [] - class variable
  @@all = []
# create initialize method w/argument (name)
  def initialize(name)
  
  end 

# create class methods for:
    # - self.all
  def self.all 
    # - this method will return contents of @@all array
    @@all
  end 
    # - self.destroy_all 
  def self.destroy_all
    # - set @@all to an empty array
    @@all = []
  end

# create save instance method
  
  # - this method will add Song instances to the @@all array

# create self.create class method - this will initialize a new song and save the song in the @@all array 

end 