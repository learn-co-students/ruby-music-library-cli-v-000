class Genre 
  extend Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :song
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  # def save
  #   @@all << self
  # end
  
  # def destroy_all
  #   @@all.clear
  # end
  
  # def self.count
  #   @@all.size
  # end
  
end