class Artist
#==================modules=====================
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
#=================properties===================
  attr_accessor :name, :songs
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
