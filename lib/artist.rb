class Artist
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  include Concerns::Persistable::Save
#=================properties===================
  attr_accessor :name, :songs
  def self.all; @@all end
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
