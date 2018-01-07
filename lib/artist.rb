class Artist
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  include Concerns::Persistable::Save
#=================properties===================
  attr_accessor :name, :songs
  # @@all = []
  def self.all; @@all end
  # come back to this to try to abstract away
#=================intialize====================
  # def initialize(name)
  #   self.songs = []
  #   self.name = name
  # end
#==================class=======================
  # def self.destroy_all
  #   self.all.clear
  # end
#=================instance=====================
  # def save
  #   self.class.all << self
  # end

  def add_song(song)
    song.artist ||= self
    songs << song unless songs.include?(song)
  end

  def genres
    self.songs.map(&:genre).uniq
  end
#=============custom constructor===============
  # def self.create(name)
  #   artist = self.new(name).tap {|o| o.save}
  # end
#==============================================
end
