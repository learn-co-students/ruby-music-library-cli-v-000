class Genre
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
#=================properties===================
  attr_accessor :name, :songs
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
