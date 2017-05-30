class Genre
  extend Concerns::Findable
  extend  Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
   self.songs.collect {|song| song.artist}.uniq
 end

end
