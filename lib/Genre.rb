class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable
  extend NewModules::ClassMethods
  include NewModules::InstanceMethods

  def initialize(name)
    self.class.destroy_all
    @name = name
    @songs = []
  end

  def artists
    collection = []
    @songs.collect do |song|
      collection << song.artist
    end
    collection.uniq
  end

end
