class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable
  #extend NewModules::ClassMethods
  #include NewModules::InstanceMethods

  @@all = []

  def initialize(name)
  #  self.class.destroy_all
    @name = name
    @songs = []
  end

  def artists
    collection = []
    @songs.collect do |song|
      collection << song.artist
    end
    collection.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
    #binding.pry
  end

  def save
    self.class.all << self
  end

end
