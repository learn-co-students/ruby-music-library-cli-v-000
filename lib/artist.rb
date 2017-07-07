class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end

  def to_s
    self.name
  end

  def save
    @@all << self
  end
end
# class Artist
#   extend Concerns::Findable
#   attr_accessor :name, :songs
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#
#   def self.create(name)
#     new(name).tap{|a| a.save}
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def add_song(song) # has_many stories interface
#     # raise AssociationTypeMismatchError if !story.is_a?(Story)
#     @songs << song unless @songs.include?(song)
#     song.artist = self unless song.artist == self
#   end
#
#   def genres
#     self.songs.collect{|s| s.genre}.uniq
#   end
# end
