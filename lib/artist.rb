class Artist < Person

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    newInstance = self.new(name)
    newInstance.save
    newInstance
  end

end

# binding.pry
