class Artist
  extend Concerns::Findable
  #include Findable::InstanceMethods

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_object = self.new(name)
    new_object.save
    new_object
  end

  attr_accessor :name, :songs

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def genres
    self.songs.collect {|song| song.genre}.compact.uniq
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song unless self.songs.include?(song)
    song
  end

  def save
    self.class.all << self
  end
end
