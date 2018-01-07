class Genre
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
    song.genre ||= self
    songs << song unless songs.include?(song)
  end
  
  def artists
    self.songs.map(&:artist).uniq
  end
#==============================================
end
