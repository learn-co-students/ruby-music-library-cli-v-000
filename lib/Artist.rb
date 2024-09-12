class Artist
  attr_accessor :name, :songs

  extend Concerns::Findable
  #extend NewModules::ClassMethods
  #include NewModules::InstanceMethods

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    unless @songs.include?(song)
      @songs << song
    end
  end

  def genres
    collection = []
    @songs.collect do |song|
      collection << song.genre
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
