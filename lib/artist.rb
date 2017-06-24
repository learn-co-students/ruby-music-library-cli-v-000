class Artist
  extend Concerns::ClassMethods
  extend Concerns::Findable
  extend Concerns::Searchable
  include Concerns::InstanceMethods
  attr_accessor :name, :songs

  def self.all
    @@all
  end

  def add_song(song)
    self.songs.include?(song) || @songs << song
    song.artist || song.artist = self
  end

  def genres
    self.songs.collect{|obj| obj.genre}.uniq
  end

end
