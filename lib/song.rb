class Song
  # extend Memorable::ClassMethods
  # include Memorable::InstanceMethods
  # include Paramable
  # extend Findable

  attr_accessor :name,:artist, :genre


  @@all = []


  def initialize(name, artist = nil)
     @name = name
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      if song.name == name
        return song
      end
    end
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
   end

end
