class Genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  extend Concerns::Searchable
  include Concerns::InstanceMethods
  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def add_song(song)
    self.songs.include?(song) || @songs << song
  end

  def artists
    self.songs.collect{|obj| obj.artist}.uniq
  end

end
