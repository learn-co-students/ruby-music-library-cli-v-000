class Artist 
  extend Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :song, :genre
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize
    save
  end
  
  def add_song
    @@all << song 
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