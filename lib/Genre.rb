class Genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods


  attr_reader :songs, :name, :artist

  @@all = []

  def self.all
    @@all
  end

#==========InstanceMethods=======================================

  def initialize(name)
    super
    @songs = []
  end

  def artists
    songs.collect{|obj| obj.artist}.uniq
   end


end
