class Genre 
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.create(genre)
    new_genre = new(genre)
    new_genre.save 
    new_genre
  end
  
  def artists
    songs.map { |song| song.artist }.uniq
  end 
end