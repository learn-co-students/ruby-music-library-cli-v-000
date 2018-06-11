class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def artists
    arts = []
    @songs.each{|s| arts << s.artist if !arts.include?(s.artist)}
    arts
  end
end
