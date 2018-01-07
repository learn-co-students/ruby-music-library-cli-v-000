class Song
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::Save
#=================properties===================
  attr_accessor :name, :artist, :genre
  # @@all = []
  def self.all; @@all end
  # come back to this to try to abstract away
#=================intialize====================
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
#==================class=======================
  # def self.destroy_all
  #   self.all.clear
  # end

  # def self.find_by_name(name)
  #   # self.all.find(&:name)
  #   self.all.find {|o| name == o.name}
  # end

  # def self.find_or_create_by_name(name)
  #   find = self.find_by_name(name)
  #   find == nil ? self.create(name) : find
  # end


#=================instance=====================
  # def save
  #   self.class.all << self
  # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
#==================custom======================
  # def self.create(name)
  #   song = self.new(name).tap {|o| o.save}
  # end
#==============================================
end
