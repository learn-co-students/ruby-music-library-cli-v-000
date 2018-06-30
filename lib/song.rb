class Song 
  extend Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize
    save
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
  
  # def self.find_by_name
  #   @@all.detect {|artist| artist.name == name}
  # end
  
end
  