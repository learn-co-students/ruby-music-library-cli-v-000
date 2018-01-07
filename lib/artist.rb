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
#=================instance=====================
  def add_song(song)
    song.artist ||= self
    songs << song unless songs.include?(song)
  end

  def genres
    self.songs.map(&:genre).uniq
  end
#==============================================
end
