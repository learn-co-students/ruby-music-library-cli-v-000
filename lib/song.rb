class Song
  attr_accessor :name, :artist
  #attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
    #binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name).tap do |song|
      song.save
    end
  end

  def artist=(artist_name)
    #binding.pry
    #artist_name.songs << self unless artist_name.songs.include?(self)
    #@artist = artist_name
    artist_name.add_song(self)
    binding.pry
    artist_name
  end

end
